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
        
        let elementPersonne = MomElement(name: "Personne")
        let elementStatus = MomElement(name: "Status")
        let elementFunction = MomElement(name: "Function")

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

    func testEntityWithAttribute(){
        var momXML = MomXML()
        var entitySociete = MomEntity(name: "Societe")
        let attrFirstName = MomAttribute(name: "name", attributeType: MomAttribute.AttributeType.string)
        let attrlastName = MomAttribute(name: "adresse", attributeType: MomAttribute.AttributeType.string)
        let attrIdSociete = MomAttribute(name: "id", attributeType: MomAttribute.AttributeType.integer16)
        entitySociete.attributes.append(attrFirstName)
        entitySociete.attributes.append(attrlastName)
        entitySociete.attributes.append(attrIdSociete)
        
        var entityFournissieur = MomEntity(name: "Fournissieur")
        let attrFirstNameFournissieur = MomAttribute(name: "firstname", attributeType: MomAttribute.AttributeType.string)
        let attrlastNameFournissieur = MomAttribute(name: "lastname", attributeType: MomAttribute.AttributeType.string)
        let attrIdClient = MomAttribute(name: "id", attributeType: MomAttribute.AttributeType.integer16)
        entityFournissieur.attributes.append(attrFirstNameFournissieur)
        entityFournissieur.attributes.append(attrlastNameFournissieur)
        entityFournissieur.attributes.append(attrIdClient)
        
        let elementSociete = MomElement(name: "Societe")
        let elementFournissieur = MomElement(name: "Status")
        
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
        let attrFirstName = MomAttribute(name: "firstname", attributeType: MomAttribute.AttributeType.string)
        let attrlastName = MomAttribute(name: "lastname", attributeType: MomAttribute.AttributeType.string)
        let attrIdClient = MomAttribute(name: "id", attributeType: MomAttribute.AttributeType.integer16)
        entityClient.attributes.append(attrFirstName)
        entityClient.attributes.append(attrlastName)
        entityClient.attributes.append(attrIdClient)
        entityClient.userInfo.add(key: "name1", value: "valuename1")
        let myrelationshipClient = MomRelationship(name: "client_commande", destinationEntity: "Commande")
        entityClient.relationship.append(myrelationshipClient)
        
        
        var entityCommande = MomEntity(name: "Commande")
        let attrDate = MomAttribute(name: "date", attributeType: MomAttribute.AttributeType.date)
        let attrDescriptionCommande = MomAttribute(name: "descriptioncommande", attributeType: MomAttribute.AttributeType.string)
        let attrIdCommande = MomAttribute(name: "id", attributeType: MomAttribute.AttributeType.integer16)
        entityCommande.attributes.append(attrIdCommande)
        entityCommande.attributes.append(attrDate)
        entityCommande.attributes.append(attrDescriptionCommande)
        entityCommande.userInfo.add(key: "name2", value: "valuename2")
        let myrelationshipCommande = MomRelationship(name: "commande_client", destinationEntity: "Client")
        let myrelationshipCommande2 = MomRelationship(name: "commande_produit", destinationEntity: "Produit")
        entityCommande.relationship.append(myrelationshipCommande)
        entityCommande.relationship.append(myrelationshipCommande2)
        
        var entityProduit = MomEntity(name: "Produit")
        let attrName = MomAttribute(name: "name", attributeType: MomAttribute.AttributeType.string)
        let attrPrix = MomAttribute(name: "prix", attributeType: MomAttribute.AttributeType.double)
        let attrReference = MomAttribute(name: "reference", attributeType: MomAttribute.AttributeType.string)
        let attrIdProduit = MomAttribute(name: "id", attributeType: MomAttribute.AttributeType.integer16)
        entityProduit.attributes.append(attrIdProduit)
        entityProduit.attributes.append(attrName)
        entityProduit.attributes.append(attrPrix)
        entityProduit.attributes.append(attrReference)
        let myrelationshipProduit = MomRelationship(name: "produit_commande", destinationEntity: "Commande")
        entityProduit.relationship.append(myrelationshipProduit)
        
        let elementClient = MomElement(name: "Client", positionX: 106, positionY: -45, width: 128, height: 118)
        let elementProduit = MomElement(name: "Produit")
        let elementCommande = MomElement(name: "Commande")
        
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
    
    func testEquatableAttribute(){
        //attribut
        let attrName = MomAttribute(name: "name", attributeType: .string)
        XCTAssertEqual(attrName, attrName)
        XCTAssertEqual(attrName, MomAttribute(name: "name", attributeType: .string))
        
        
        XCTAssertNotEqual(attrName, MomAttribute(name: "name", attributeType: .integer16), "attributeType different")
        XCTAssertNotEqual(attrName, MomAttribute(name: "name2", attributeType: .string), "name different")
        
        
        XCTAssertNotEqual(attrName, MomAttribute(name: "name", attributeType: .string, isOptional: true), "isOptional different")
    }
    
    func testEquatableElement(){
        //elements
        let elementClient = MomElement(name: "Client", positionX: 106, positionY: -45, width: 128, height: 118)
        XCTAssertEqual(elementClient, elementClient)
        XCTAssertEqual(elementClient, MomElement(name: "Client", positionX: 106, positionY: -45, width: 128, height: 118))
        
        
        XCTAssertNotEqual(elementClient, MomElement(name: "Client2", positionX: 106, positionY: -45, width: 128, height: 118), "name different")
        XCTAssertNotEqual(elementClient, MomElement(name: "Client", positionX: 588, positionY: -45, width: 128, height: 118), "positionX different")
        XCTAssertNotEqual(elementClient, MomElement(name: "Client", positionX: 106, positionY: 454, width: 128, height: 118), "positionY different")
        XCTAssertNotEqual(elementClient, MomElement(name: "Client", positionX: 106, positionY: -45, width: 44, height: 118), "width different")
        XCTAssertNotEqual(elementClient, MomElement(name: "Client", positionX: 106, positionY: -45, width: 128, height: 1), "height different")
    }

    func testEquatableRelationship(){
        //relationship
        let myrelationshipProduit = MomRelationship(name: "produit_commande", destinationEntity: "Commande")
        XCTAssertEqual(myrelationshipProduit, myrelationshipProduit)
        XCTAssertEqual(myrelationshipProduit, MomRelationship(name: "produit_commande", destinationEntity: "Commande"))
        
        
        XCTAssertNotEqual(myrelationshipProduit, MomRelationship(name: "produit_command", destinationEntity: "Commande"), "name different")

        var myrelationshipProduit2 = MomRelationship(name: "produit_commande", destinationEntity: "Commande")
        myrelationshipProduit2.deletionRule = .deny
        XCTAssertNotEqual(myrelationshipProduit2, myrelationshipProduit, "deletionRule different")
    }

    func testEquatable(){
        //entity
        var entityClient = MomEntity(name: "Client")
        let attrFirstName = MomAttribute(name: "firstname", attributeType: .string)
        let attrlastName = MomAttribute(name: "lastname", attributeType: .string)
        let attrIdClient = MomAttribute(name: "id", attributeType: .integer16)
        entityClient.attributes.append(attrFirstName)
        entityClient.attributes.append(attrlastName)
        entityClient.attributes.append(attrIdClient)
        entityClient.userInfo.add(key: "name1", value: "valuename1")
        let myrelationshipClient = MomRelationship(name: "client_commande", destinationEntity: "Commande")
        entityClient.relationship.append(myrelationshipClient)
        XCTAssertEqual(entityClient, entityClient)

        // fetch
        let featchRequest = MomFetchRequest(name: "name", entity: entityClient.name, predicateString: "TRUE")
        let emptyFetchRequest = MomFetchRequest(name: "", entity: "", predicateString: "")
        XCTAssertEqual(featchRequest, featchRequest)
        XCTAssertNotEqual(featchRequest, emptyFetchRequest)

        let fetchProperty = MomFetchedProperty(name: "nametest", fetchRequest: featchRequest)
        XCTAssertEqual(fetchProperty, fetchProperty)
        XCTAssertNotEqual(fetchProperty, MomFetchedProperty(name: "", fetchRequest: emptyFetchRequest))
        XCTAssertNotEqual(fetchProperty, MomFetchedProperty(name: "t", fetchRequest: featchRequest))

        //model
        var momModel = MomModel()
        momModel.entities.append(entityClient)
        let elementClient = MomElement(name: "Client", positionX: 106, positionY: -45, width: 128, height: 118)
        momModel.elements.append(elementClient)
        XCTAssertEqual(momModel, momModel)
        //MomXML
        var momXML = MomXML()
        momXML.model.entities.append(entityClient)
        momXML.model.elements.append(elementClient)
        XCTAssertEqual(momXML, momXML)
        
        
        var momXML2 = MomXML()
        momXML2.model.entities.append(entityClient)
        momXML2.model.elements.append(elementClient)
        XCTAssertEqual(momXML, momXML2)
        
        let momXML3 = MomXML()
        XCTAssertNotEqual(momXML3, momXML)

        let momXML4 = MomXML()
        momXML2.model.entities.append(MomEntity(name: "Client4"))
        momXML2.model.elements.append(MomElement(name: "Client4", positionX: 106, positionY: -45, width: 128, height: 118))
        XCTAssertNotEqual(momXML4, momXML)
    }
    
    // MARK: test from files
    
    func testXMLToMomModel1() {
        if let url = Bundle(for: MomXMLTests.self).url(forResource: "model", withExtension: "xml") {
            do {
                let xmlString = try String(contentsOf: url)
                let xml = SWXMLHash.parse(xmlString)
                guard let parsedMom = MomXML(xml: xml) else {
                    XCTFail("Failed to parse xml")
                    return
                }
                let momModel = parsedMom.model
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
                    for attr in entity.fetchProperties {
                        print("\(attr.name)  \(attr.fetchRequest.predicateString)")
                    }
                }
                
                for element in momElements {
                    elements.append(element)
                    print(element.name)
                }
                XCTAssertEqual(momEntities.count, momElements.count)

                /// Important test, check that rendered data it's same as parsed data
                let xmlFromParsed = parsedMom.xml
                // print(xmlFromParsed)
                let recreatedMom = MomXML(xml: SWXMLHash.parse(xmlFromParsed))
                XCTAssertEqual(recreatedMom, parsedMom)
                
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
                guard let parsedMom = MomXML(xml: xml) else {
                    XCTFail("Failed to parse xml")
                    return
                }
                let momModel = parsedMom.model
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
                
                /// Important test, check that rendered data it's same as parsed data
                let xmlFromParsed = parsedMom.xml
                // print(xmlFromParsed)
                let recreatedMom = MomXML(xml: SWXMLHash.parse(xmlFromParsed))
                XCTAssertEqual(recreatedMom, parsedMom)
            } catch {
                XCTFail("Unable to read test file Model \(error)")
            }
        } else {
            XCTFail("Unable to get test file Model")
        }
    }
    
    func testJsonToXML() {
        if let url = Bundle(for: MomXMLTests.self).url(forResource: "modelJsonToXML", withExtension: "xml") {
            do {
                let xmlString = try String(contentsOf: url)
                let xml = SWXMLHash.parse(xmlString)
                guard let parsedMom = MomXML(xml: xml) else {
                    XCTFail("Failed to parse xml")
                    return
                }
                let momModel = parsedMom.model
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
                
                /// Important test, check that rendered data it's same as parsed data
                let xmlFromParsed = parsedMom.xml
                // print(xmlFromParsed)
                let recreatedMom = MomXML(xml: SWXMLHash.parse(xmlFromParsed))
                XCTAssertEqual(recreatedMom, parsedMom)
            } catch {
                XCTFail("Unable to read test file Model \(error)")
            }
        } else {
            XCTFail("Unable to get test file Model")
        }
    }
    
    func testRelationships() {

        let modelString = """
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<model type="com.apple.IDECoreDataModeler.DataModel" documentVersion="1.0" lastSavedToolsVersion="14490.99" systemVersion="18F132" minimumToolsVersion="Automatic" sourceLanguage="Swift" userDefinedModelVersionIdentifier="">
<entity name="Entity" representedClassName="Entity" syncable="YES" codeGenerationType="class">
<attribute name="attribute1" optional="YES" attributeType="Integer 16" defaultValueString="0" usesScalarValueType="YES" syncable="YES"/>
<relationship name="relationEntity1" optional="YES" toMany="YES" deletionRule="Cascade" destinationEntity="Entity2" inverseName="relationEntity2" inverseEntity="Entity2" syncable="YES"/>
</entity>
<entity name="Entity2" representedClassName="Entity2" syncable="YES" codeGenerationType="class">
<relationship name="relationEntity2" optional="YES" maxCount="1" deletionRule="Nullify" destinationEntity="Entity" inverseName="relationEntity1" inverseEntity="Entity" syncable="YES"/>
</entity>
<elements>
<element name="Entity" positionX="-1697.54296875" positionY="-87.4921875" width="128" height="238"/>
<element name="Entity2" positionX="-403.99609375" positionY="15.84375" width="128" height="58"/>
</elements>
</model>
"""
        
        let xml = SWXMLHash.parse(modelString)
        guard let parsedMom = MomXML(xml: xml) else {
            XCTFail("Unable to parse String XML model")
            return
        }
        
        let parsed = parsedMom.model.coreData
        let entities = parsed.entities
        for entity in entities { //Entity1
            let relationships = entity.relationshipsByName
            for (_, relation) in relationships { //relationEntity1
                XCTAssertNotNil(relation.destinationEntity, "missing destination entity for \(relation) of \(entity)") //Entity2
                XCTAssertNotNil(relation.inverseRelationship, "missing inverse relation for \(relation) of \(entity)") //relationEntity2
                
                if let inverseRelationship = relation.inverseRelationship {
                    XCTAssertEqual(inverseRelationship.inverseRelationship?.name, relation.name, "inverse of inverse is not self for \(relation) of \(entity) : inverseRelationship is \(String(describing: inverseRelationship.inverseRelationship))")
                    XCTAssertEqual(inverseRelationship.entity.name, relation.destinationEntity?.name, "entity of inverse is not self for \(relation) of \(entity) : inverseRelationship is \(String(describing: inverseRelationship.inverseRelationship))")
                    if let destination = relation.destinationEntity {
                        let destinationRelationships = destination.relationshipsByName.values
                        XCTAssertTrue(destinationRelationships.contains(inverseRelationship))
                    } // else already asserted
                } // else already asserted
            }
        }
    }
    
}

