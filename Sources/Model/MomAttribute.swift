//  Created by Eric Marchand on 07/06/2017.
//  Copyright © 2017 Eric Marchand. All rights reserved.
//

import Foundation

public struct MomAttribute {

    public var name: String
    public var attributeType: AttributeType

    public var defaultValueString: String?
    public var defaultDateTimeInterval: String?
    public var minValueString: String?
    public var maxValueString: String?

    public var syncable: Bool = true
    public var isOptional: Bool = false
    public var isTransient: Bool = false
    public var isIndexed: Bool = false
    public var usesScalarValueType: Bool = false
    public var isIndexedBySpotlight: Bool = false
    public var isDerived: Bool = false
    public var derivationExpression: String?
    public var valueTransformerName: String?

    public var userInfo = MomUserInfo()

    public init(name: String, attributeType: AttributeType, isOptional: Bool = false, isTransient: Bool = false) {
        self.name = name
        self.attributeType = attributeType
        self.isOptional = isOptional
        self.isTransient = isTransient
    }

    public enum AttributeType: String {
        case boolean = "Boolean"
        case string = "String"
        case date = "Date"
        case float = "Float"
        case decimal = "Decimal"
        case double = "Double"
        case binary = "Binary"
        case integer16 = "Integer 16"
        case integer32 = "Integer 32"
        case integer64 = "Integer 64"
        case transformable = "Transformable"
        case undefined = "Undefined"
        case objectID = "ObjectID"
        case uuid = "UUID"
        case uri = "URI"
    }

}
