//
//  MomFetchIndex.swift
//  MomXML
//
//  Created by Eric Marchand on 09/10/2019.
//  Copyright © 2019 phimage. All rights reserved.
//

import Foundation

public struct MomFetchIndex {

    public var name: String
    public var elements: [MomFetchIndexElement] = []

    public mutating func add(property: String, type: MomFetchIndexElementType, order: String) {
        elements.append(MomFetchIndexElement(property: property, type: type, order: order))
    }

    public var isEmpty: Bool {
        return elements.isEmpty
    }

    public init(name: String, elements: [MomFetchIndexElement] = []) {
        self.name = name
        self.elements = elements
    }

}

public enum MomFetchIndexElementType: String {
    case binary
    case rTree
}

public struct MomFetchIndexElement {

    public var property: String?
    public var expression: String?
    public var expressionType: MomAttribute.AttributeType? // XXX AttributeType ? or more
    public var type: MomFetchIndexElementType
    public var order: String

    public init(property: String? = nil, expression: String? = nil, expressionType: MomAttribute.AttributeType? = nil, type: MomFetchIndexElementType, order: String) {
        self.property = property
        self.expression = expression
        self.expressionType = expressionType
        self.type = type
        self.order = order
    }

    public var isExpression: Bool {
        return self.expression != nil
    }

    public var isProperty: Bool {
        return self.property != nil
    }

    public var isAscending: Bool {
        return self.order == "ascending"
    }
}
