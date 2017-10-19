//
//  NSAttributeDescription+MomXML.swift
//  MomXML
//
//  Created by Eric Marchand on 09/06/2017.
//  Copyright © 2017 phimage. All rights reserved.
//

import Foundation
import CoreData

extension NSAttributeDescription {

    public var mom: MomAttribute {
       var mom = MomAttribute(name: self.name, attributeType: self.attributeType.mom)

        if let defaultValue = self.defaultValue as? NSObject {
            mom.defaultValueString = defaultValue.description
        }
        mom.isOptional = self.isOptional
        mom.isTransient = self.isTransient
        if #available(iOS 11, *), #available(macOS 10.13, *) {
        } else {
            mom.isIndexed = self.isIndexed
        }
        mom.isIndexedBySpotlight = self.isIndexedBySpotlight

       return mom
    }

    public var momAttributeType: MomAttribute.AttributeType {
        return self.attributeType.mom
    }
}

extension NSAttributeType {

    public var mom: MomAttribute.AttributeType {
        switch self {
        case .binaryDataAttributeType:
            return .binary
        case .booleanAttributeType:
            return .boolean
        case .dateAttributeType:
            return .date
        case .decimalAttributeType:
            return .decimal
        case .doubleAttributeType:
            return .double
        case .floatAttributeType:
            return .float
        case .integer16AttributeType:
            return .integer16
        case .integer32AttributeType:
            return .integer32
        case .integer64AttributeType:
            return .integer64
        case .stringAttributeType:
            return .string
        case .transformableAttributeType:
            return .transformable
        case .undefinedAttributeType:
            return .undefined
        case .objectIDAttributeType:
            return .objectID
        default:
            if #available(iOS 11, *), #available(macOS 10.13, *) {
                switch self {
                case .UUIDAttributeType:
                    return .uuid
                case .URIAttributeType:
                    return .uri
                default:
                    return .undefined
                }
            } else {
                return .undefined
            }
        }
    }

}
