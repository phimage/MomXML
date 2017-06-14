//
//  MomXMLTests.swift
//  MomXMLTests
//
//  Created by Eric Marchand on 07/06/2017.
//  Copyright © 2017 phimage. All rights reserved.
//

import XCTest
@testable import MomXML
import SWXMLHash

class MomXMLTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testCreateReadEmpty() {
        let mom = MomXML()

        let xmlString = mom.xml
        XCTAssertFalse(xmlString.isEmpty)
        
        let xml = SWXMLHash.parse(xmlString)

        let parsedMom = MomXML(xml: xml)
        XCTAssertNotNil(parsedMom)

        /// XXX Before comparing maybe do an xmlLint or do a better xml compare
        XCTAssertEqual(parsedMom!.xml, xmlString)
    }
    // momXML; userinfo
    //entity ; Element; Attribut; model;  ; relationship ;
    func testMomEntityEmpty(){
        var momXML = MomXML()
        let entityPersonne = MomEntity(name: "Personne")
        let entityStatus = MomEntity(name: "Status")
        let entityFunction = MomEntity(name: "Function")
        
        let elementPersonne = MomElement.init(name: "Personne")
        let elementStatus = MomElement.init(name: "Status")
        let elementFunction = MomElement.init(name: "Function")

        momXML.model.entities.append(entityPersonne)
        momXML.model.entities.append(entityStatus)
        momXML.model.entities.append(entityFunction)
        
        momXML.model.elements.append(elementPersonne)
        momXML.model.elements.append(elementStatus)
        momXML.model.elements.append(elementFunction)
        
        let xmlString = momXML.xml
        print(xmlString)
        
        XCTAssertFalse(xmlString.isEmpty)
        
        let xml = SWXMLHash.parse(xmlString)
        
        let parsedMom = MomXML(xml: xml)
        XCTAssertNotNil(parsedMom)
    }
    func testEntityWithAttribut(){
        var momXML = MomXML()
        var entitySociete = MomEntity(name: "Societe")
        let attrFirstName = MomAttribute.init(name: "name", attributeType: MomAttribute.AttributeType.string)
        let attrlastName = MomAttribute.init(name: "adresse", attributeType: MomAttribute.AttributeType.string)
        let attrIdSociete = MomAttribute.init(name: "id", attributeType: MomAttribute.AttributeType.integer16)
        entitySociete.attributes.append(attrFirstName)
        entitySociete.attributes.append(attrlastName)
        entitySociete.attributes.append(attrIdSociete)
        
        var entityFournissieur = MomEntity(name: "Fournissieur")
        let attrFirstNameFournissieur = MomAttribute.init(name: "firstname", attributeType: MomAttribute.AttributeType.string)
        let attrlastNameFournissieur = MomAttribute.init(name: "lastname", attributeType: MomAttribute.AttributeType.string)
        let attrIdClient = MomAttribute.init(name: "id", attributeType: MomAttribute.AttributeType.integer16)
        entityFournissieur.attributes.append(attrFirstNameFournissieur)
        entityFournissieur.attributes.append(attrlastNameFournissieur)
        entityFournissieur.attributes.append(attrIdClient)
        
        let elementSociete = MomElement.init(name: "Societe")
        let elementFournissieur = MomElement.init(name: "Status")
        
        momXML.model.entities.append(entitySociete)
        momXML.model.entities.append(entityFournissieur)
        
        momXML.model.elements.append(elementSociete)
        momXML.model.elements.append(elementFournissieur)
        
        
        let xmlString = momXML.xml
        print(xmlString)
        
        XCTAssertFalse(xmlString.isEmpty)
        
        let xml = SWXMLHash.parse(xmlString)
        
        let parsedMom = MomXML(xml: xml)
        XCTAssertNotNil(parsedMom)
        
    }
    func testMomEntityWithRelation() {
        var momXML = MomXML()
        var entityClient = MomEntity(name: "Client")
        let attrFirstName = MomAttribute.init(name: "firstname", attributeType: MomAttribute.AttributeType.string)
        let attrlastName = MomAttribute.init(name: "lastname", attributeType: MomAttribute.AttributeType.string)
        let attrIdClient = MomAttribute.init(name: "id", attributeType: MomAttribute.AttributeType.integer16)
        entityClient.attributes.append(attrFirstName)
        entityClient.attributes.append(attrlastName)
        entityClient.attributes.append(attrIdClient)
        entityClient.userInfo.add(key: "name1", value: "valuename1")
        let myrelationshipClient = MomRelationship.init(name: "client_commande", destinationEntity: "Commande")
        entityClient.relationship.append(myrelationshipClient)
        
        
        var entityCommande = MomEntity(name: "Commande")
        let attrDate = MomAttribute.init(name: "date", attributeType: MomAttribute.AttributeType.date)
        let attrDescriptionCommande = MomAttribute.init(name: "descriptioncommande", attributeType: MomAttribute.AttributeType.string)
        let attrIdCommande = MomAttribute.init(name: "id", attributeType: MomAttribute.AttributeType.integer16)
        entityCommande.attributes.append(attrIdCommande)
        entityCommande.attributes.append(attrDate)
        entityCommande.attributes.append(attrDescriptionCommande)
        entityCommande.userInfo.add(key: "name2", value: "valuename2")
        let myrelationshipCommande = MomRelationship.init(name: "commande_client", destinationEntity: "Client")
        let myrelationshipCommande2 = MomRelationship.init(name: "commande_produit", destinationEntity: "Produit")
        entityCommande.relationship.append(myrelationshipCommande)
        entityCommande.relationship.append(myrelationshipCommande2)
        
        var entityProduit = MomEntity(name: "Produit")
        let attrName = MomAttribute.init(name: "name", attributeType: MomAttribute.AttributeType.string)
        let attrPrix = MomAttribute.init(name: "prix", attributeType: MomAttribute.AttributeType.double)
        let attrReference = MomAttribute.init(name: "reference", attributeType: MomAttribute.AttributeType.string)
        let attrIdProduit = MomAttribute.init(name: "id", attributeType: MomAttribute.AttributeType.integer16)
        entityProduit.attributes.append(attrIdProduit)
        entityProduit.attributes.append(attrName)
        entityProduit.attributes.append(attrPrix)
        entityProduit.attributes.append(attrReference)
        let myrelationshipProduit = MomRelationship.init(name: "produit_commande", destinationEntity: "Commande")
        entityProduit.relationship.append(myrelationshipProduit)
        
        let elementClient = MomElement.init(name: "Client", positionX: 106, positionY: -45, width: 128, height: 118)
        let elementProduit = MomElement.init(name: "Produit")
        let elementCommande = MomElement.init(name: "Commande")
        
        var momModel = MomModel()
        momModel.entities.append(entityClient)
        momModel.entities.append(entityProduit)
        momModel.entities.append(entityCommande)
        
        momModel.elements.append(elementClient)
        momModel.elements.append(elementCommande)
        momModel.elements.append(elementProduit)
        
        XCTAssertEqual(momModel.check(), true)
        momModel.moveElements()
        
        momXML.model = momModel
        
        let xmlString = momXML.xml
        print(xmlString)
        
        XCTAssertFalse(xmlString.isEmpty)
        
        let xml = SWXMLHash.parse(xmlString)
        
        let parsedMom = MomXML(xml: xml)
        XCTAssertNotNil(parsedMom)
    }
    
    func testEquatable (){
        //attribut
        let attrName = MomAttribute.init(name: "name", attributeType: MomAttribute.AttributeType.string)
        XCTAssertEqual(attrName == attrName, true)
        //elements
        let elementClient = MomElement.init(name: "Client", positionX: 106, positionY: -45, width: 128, height: 118)
        XCTAssertEqual(elementClient == elementClient, true)
        //relationship
        let myrelationshipProduit = MomRelationship.init(name: "produit_commande", destinationEntity: "Commande")
        XCTAssertEqual(myrelationshipProduit == myrelationshipProduit, true)
        //entity
        var entityClient = MomEntity(name: "Client")
        let attrFirstName = MomAttribute.init(name: "firstname", attributeType: MomAttribute.AttributeType.string)
        let attrlastName = MomAttribute.init(name: "lastname", attributeType: MomAttribute.AttributeType.string)
        let attrIdClient = MomAttribute.init(name: "id", attributeType: MomAttribute.AttributeType.integer16)
        entityClient.attributes.append(attrFirstName)
        entityClient.attributes.append(attrlastName)
        entityClient.attributes.append(attrIdClient)
        entityClient.userInfo.add(key: "name1", value: "valuename1")
        let myrelationshipClient = MomRelationship.init(name: "client_commande", destinationEntity: "Commande")
        entityClient.relationship.append(myrelationshipClient)
        XCTAssertEqual(entityClient == entityClient, true)
        //model
        var momModel = MomModel()
        momModel.entities.append(entityClient)
        momModel.elements.append(elementClient)
        XCTAssertEqual(momModel == momModel, true)
        //MomXML
        var momXML = MomXML()
        momXML.model.entities.append(entityClient)
        momXML.model.elements.append(elementClient)
        XCTAssertEqual(momXML == momXML, true)
    }
    
    func testXMLToMomModel1() {
        if let url = Bundle(for: MomXMLTests.self).url(forResource: "model", withExtension: "xml") {
            do {
                let xmlString = try String(contentsOf: url)
                let xml = SWXMLHash.parse(xmlString)
                let parsedMom = MomXML(xml: xml) as! MomXML
                let momModel = parsedMom.model as! MomModel
                //print(xml)
                //print("++++++++")
                //print(momModel.xml)
                let momEntities = momModel.entities
                let momElements = momModel.elements
                var entites: [MomEntity] = []
                var elements: [MomElement] = []
                
                for entity in momEntities {
                    entites.append(entity)
                    print(entity.name)
                    for attr in entity.attributes {
                        print("\(attr.name)  \(attr.attributeType)")
                    }
                    for attr in entity.relationship {
                        print("\(attr.name)  \(attr.destinationEntity)")
                    }
                }
                
                for element in momElements {
                    elements.append(element)
                    print(element.name)
                }
                XCTAssertEqual(momEntities.count, momElements.count)
            } catch {
                XCTFail("Unable to read test file Model \(error)")
            }
        } else {
            XCTFail("Unable to get test file Model")
        }
    }
    func testXMLToMomModel2() {
        if let url = Bundle(for: MomXMLTests.self).url(forResource: "model2", withExtension: "xml") {
            do {
                let xmlString = try String(contentsOf: url)
                let xml = SWXMLHash.parse(xmlString)
                let parsedMom = MomXML(xml: xml) as! MomXML
                let momModel = parsedMom.model as! MomModel
                let momEntities = momModel.entities
                let momElements = momModel.elements
                var entites: [MomEntity] = []
                var elements: [MomElement] = []
                
                for entity in momEntities {
                    entites.append(entity)
                    print(entity.name)
                    for attr in entity.attributes {
                        print("\(attr.name)  \(attr.attributeType)")
                    }
                    for attr in entity.relationship {
                        print("\(attr.name)  \(attr.destinationEntity)")
                    }
                }
                print("+++ elements :")
                for element in momElements {
                    elements.append(element)
                    print(element.name)
                }
                XCTAssertEqual(momEntities.count, momElements.count)
            } catch {
                XCTFail("Unable to read test file Model \(error)")
            }
        } else {
            XCTFail("Unable to get test file Model")
        }
    }
}
