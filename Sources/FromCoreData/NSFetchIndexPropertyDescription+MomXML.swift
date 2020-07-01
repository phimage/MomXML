//
//  MomFetchIndex+FromCoreData.swift
//  MomXML
//
//  Created by Eric Marchand on 09/10/2019.
//  Copyright © 2019 phimage. All rights reserved.
//

import Foundation
import CoreData

@available(iOS 11.0, OSX 10.13, *)
extension NSFetchIndexDescription {

    public var mom: MomFetchIndex? {
        return MomFetchIndex(name: self.name, elements: self.elements.compactMap { $0.mom })
    }

}

@available(iOS 11.0, OSX 10.13, *)
extension NSFetchIndexElementDescription {

    public var mom: MomFetchIndexElement? {
        if let property = self.propertyName {
            return MomFetchIndexElement(property: property,
                                        type: self.collationType.mom,
                                        order: self.isAscending ? "ascending" : "descending")
        }
        if let expressionDescription = self.property as? NSExpressionDescription, let expression = expressionDescription.expression {
            return MomFetchIndexElement(expression: expression.mom,
                                        expressionType: expressionDescription.expressionResultType.mom,
                                        type: self.collationType.mom,
                                        order: self.isAscending ? "ascending" : "descending")
        }
        return nil
    }

}

extension NSExpression {
    var mom: String {
        return "\(self)"
    }
}

@available(iOS 11.0, OSX 10.13, *)
extension NSFetchIndexElementType {

    public var mom: MomFetchIndexElementType {
        switch self {
        case .binary:
            return MomFetchIndexElementType.binary
        case .rTree:
            return MomFetchIndexElementType.rTree
        @unknown default:
            fatalError("unknown type \(self)")
        }
    }
}
