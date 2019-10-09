//
//  MomFetchIndex+CoreData.swift
//  MomXML
//
//  Created by Eric Marchand on 09/10/2019.
//  Copyright © 2019 phimage. All rights reserved.
//

import Foundation
import CoreData

extension MomFetchIndex {

    @available(iOS 11.0, OSX 10.13, *)
    public func coreData(properties: [String: NSPropertyDescription]) -> NSFetchIndexDescription? {
        return NSFetchIndexDescription(name: self.name, elements: self.elements.compactMap { $0.coreData(properties: properties) })
    }

}

extension MomFetchIndexElement {
    @available(iOS 11.0, OSX 10.13, *)
    public func coreData(properties: [String: NSPropertyDescription]) -> NSFetchIndexElementDescription? {
        if let property = self.property, let propertyDescription = properties[property] {
            let result = NSFetchIndexElementDescription(property: propertyDescription, collationType: self.type.coreData)
            result.isAscending = self.isAscending
            return result
        }
        if let expression = self.expression, let expressionType = self.expressionType {
            let propertyDescription = NSExpressionDescription()
            propertyDescription.expression = NSExpression(format: expression)
            propertyDescription.expressionResultType = expressionType.coreData
            let result = NSFetchIndexElementDescription(property: propertyDescription, collationType: self.type.coreData)
            result.isAscending = self.isAscending
            return result
        }
        return nil
    }
}

extension MomFetchIndexElementType {

    @available(iOS 11.0, OSX 10.13, *)
    var coreData: NSFetchIndexElementType {
        switch self {
        case .binary:
            return NSFetchIndexElementType.binary
        case .rTree:
            return NSFetchIndexElementType.rTree
        }
    }

}
