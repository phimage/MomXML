//
//  MomFetchIndex+FromXML.swift
//  MomXML
//
//  Created by Eric Marchand on 09/10/2019.
//  Copyright © 2019 phimage. All rights reserved.
//

import Foundation

extension MomFetchIndex: XMLObject {

    public init?(xml: XML) {
        guard let element = xml.element, element.name == "fetchIndex" else {
            return nil
        }
        guard let name = element.attribute(by: "name")?.text else {
                return nil
        }
        self.init(name: name)

        for child in xml.children {
            if let entry = MomFetchIndexElement(xml: child) {
                self.elements.append(entry)
            } else {
                MomXML.orphanCallback?(xml, MomFetchIndexElement.self)
            }
        }
    }

}

extension MomFetchIndexElement: XMLObject {

    public init?(xml: XML) {
        guard let element = xml.element, element.name == "fetchIndexElement" else {
            return nil
        }
        guard let typeString =  element.attribute(by: "type")?.text,
            let type = MomFetchIndexElementType(rawValue: typeString.lowercased()),
            let order = element.attribute(by: "order")?.text else {
                return nil
        }
        if let property = element.attribute(by: "property")?.text {
            self.init(property: property, type: type, order: order)
        } else if  let expression = element.attribute(by: "expression")?.text,
            let expressionTypeString = element.attribute(by: "expressionType")?.text,
            let expressionType = MomAttribute.AttributeType(rawValue: expressionTypeString) {
            self.init(expression: expression, expressionType: expressionType, type: type, order: order)
        } else {
            return nil // unknown type
        }
    }

}
