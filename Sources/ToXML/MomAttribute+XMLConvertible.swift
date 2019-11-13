//  Created by Eric Marchand on 07/06/2017.
//  Copyright © 2017 Eric Marchand. All rights reserved.
//

import Foundation

extension MomAttribute: XMLConvertible {

    public var xml: String {
        var output = "<attribute name=\"\(name)\" attributeType=\"\(attributeType.xml)\""

        output += " optional=\"\(isOptional.xml)\""

        if usesScalarValueType {
            output += " usesScalarValueType=\"\(usesScalarValueType.xml)\""
        }
        if isIndexed {
            output += " indexed=\"\(isIndexed.xml)\""
        }
        if isTransient {
            output += " transient=\"\(isTransient.xml)\""
        }
        if isDerived {
            output += " derived=\"\(isDerived.xml)\""
        }
        if let derivationExpression = derivationExpression {
            output += " derivationExpression=\"\(derivationExpression)\""
        }
        if let defaultValueString = defaultValueString {
            output += " defaultValueString=\"\(defaultValueString)\""
        }
        if let defaultDateTimeInterval = defaultDateTimeInterval {
            output += " defaultDateTimeInterval=\"\(defaultDateTimeInterval)\""
        }
        if let minValueString = minValueString {
            output += " minValueString=\"\(minValueString)\""
        }
        if let maxValueString = maxValueString {
            output += " maxValueString=\"\(maxValueString)\""
        }

        output += " syncable=\"\(syncable.xml)\""

        if let valueTransformerName = valueTransformerName {
            output += " valueTransformerName=\"\(valueTransformerName)\""
        }

        if self.userInfo.isEmpty {
            output += "/>"
        } else {
            output += ">"
            output += "\n"
            output += userInfo.xml
            output += "\n"
            output += "</attribute>"
        }

        return output
    }

}

extension MomAttribute.AttributeType: XMLConvertible {

    public var xml: String {
        return self.rawValue
    }
}
