//  Created by Eric Marchand on 07/06/2017.
//  Copyright © 2017 Eric Marchand. All rights reserved.
//

import Foundation

extension MomRelationship: XMLConvertible {

    public var xml: String {
        var output = "<relationship name=\"\(name)\" optional=\"\(isOptional.xml)\" toMany=\"\(isToMany.xml)\" ordered=\"\(isOrdered.xml)\" deletionRule=\"\(deletionRule.xml)\""
        if let maxCount = maxCount {
            output += " maxCount=\"\(maxCount)\""
        }
        if let minCount = minCount {
            output += " minCount=\"\(minCount)\""
        }
        output += " destinationEntity=\"\(destinationEntity)\""

        if let inverseName = inverseName, let inverseEntity = inverseEntity {
            output += " inverseName=\"\(inverseName)\" inverseEntity=\"\(inverseEntity)\""
        }

        if isTransient {
            output += " transient=\"\(isTransient.xml)\""
        }

        output += " syncable=\"\(syncable.xml)\""

        if userInfo.isEmpty {
            output += "/>"
        } else {
            output += ">"
            output += "\n"
            output += userInfo.xml
            output += "\n"
            output += "</relationship>"
        }

        return output
    }

}

extension MomRelationship.DeletionRule: XMLConvertible {

    public var xml: String {
        return self.rawValue
    }

}
