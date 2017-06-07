//  Created by Eric Marchand on 07/06/2017.
//  Copyright © 2017 Eric Marchand. All rights reserved.
//

import Foundation

extension MomAttribute: XMLConvertible {

    public var xml: String {
        var output = "<attribute name=\"\(name)\" attributeType=\"\(attributeType.xml)\""

        output += " optional=\"\(optional.xml)\""

        if usesScalarValueType {
            output += " usesScalarValueType=\"\(usesScalarValueType.xml)\""
        }
        if indexed {
            output += " indexed=\"\(indexed.xml)\""
        }
        if transient {
            output += " transient=\"\(transient.xml)\""
        }

        if let defaultValueString = defaultValueString {
            output += " defaultValueString=\"\(defaultValueString)\""
        }
        if let defaultDateTimeInterval = defaultDateTimeInterval {
            output += "defaultDateTimeInterval=\"\(defaultDateTimeInterval)\""
        }
        if let minValueString = minValueString {
            output += " minValueString=\"\(minValueString)\""
        }
        if let maxValueString = maxValueString {
            output += " maxValueString=\"\(maxValueString)\""
        }

        output += " syncable=\"\(syncable.xml)\"/>"

        return output
    }

}

extension MomAttribute.AttributeType: XMLConvertible {

    public var xml: String {
        return self.rawValue
    }
}
