//
//  MomAttribute+CoreData.swift
//  MomXML
//
//  Created by Eric Marchand on 18/06/2017.
//  Copyright © 2017 phimage. All rights reserved.
//

import Foundation
import CoreData

extension MomAttribute {
    public var coreData: NSAttributeDescription {
        let coreData = NSAttributeDescription()
        coreData.attributeType = self.attributeType.coreData
        coreData.name = self.name
        coreData.isOptional = self.isOptional
        if #available(iOS 11, *), #available(OSX 10.13, *) {

        } else {
            coreData.isIndexed = self.isIndexed
        }
        coreData.isIndexedBySpotlight = self.isIndexedBySpotlight
        coreData.userInfo = self.userInfo.coreData

        return coreData
    }
}

extension MomAttribute.AttributeType {

    public var coreData: NSAttributeType {
        switch self {
        case .binary:
            return .binaryDataAttributeType
        case .boolean:
            return .booleanAttributeType
        case .date:
            return .dateAttributeType
        case .decimal:
            return .decimalAttributeType
        case .double:
            return .doubleAttributeType
        case .float:
            return .floatAttributeType
        case .integer16:
            return .integer16AttributeType
        case .integer32:
            return .integer32AttributeType
        case .integer64:
            return .integer64AttributeType
        case .string:
            return .stringAttributeType
        case .transformable:
            return .transformableAttributeType
        case .undefined:
            return .undefinedAttributeType
        case .objectID:
            return .objectIDAttributeType
        default:
            if #available(iOS 11, *), #available(macOS 10.13, *) {
                switch self {
                case .uuid:
                    return .UUIDAttributeType
                case .uri:
                    return .URIAttributeType
                default:
                    return .undefinedAttributeType
                }
            } else {
                return .undefinedAttributeType
            }
        }
    }

}
