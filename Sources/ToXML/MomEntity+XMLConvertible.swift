//  Created by Eric Marchand on 07/06/2017.
//  Copyright © 2017 Eric Marchand. All rights reserved.
//

import Foundation

extension MomEntity: XMLConvertible {

    public var xml: String {
        var output = "<entity name=\"\(name)\" representedClassName=\"\(representedClassName)\" syncable=\"\(syncable.xml)\" codeGenerationType=\"\(codeGenerationType)\">\n"
        for attribute in attributes {
            output += attribute.xml
            output += "\n"
        }
        for relation in relationship {
            output += relation.xml
            output += "\n"
        }
        for fetchProperty in fetchProperties {
            output += fetchProperty.xml
            output += "\n"
        }

        if !userInfo.isEmpty {
            output += userInfo.xml
            output += "\n"
        }

        output += "</entity>"
        return output
    }
}
