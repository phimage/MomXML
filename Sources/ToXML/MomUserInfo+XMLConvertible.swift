//  Created by Eric Marchand on 07/06/2017.
//  Copyright © 2017 Eric Marchand. All rights reserved.
//

import Foundation

extension MomUserInfo: XMLConvertible {

    public var xml: String {
        var output = ""
        output += " <userInfo>\n"
        for entry in entries {
            output += entry.xml
            output += "\n"
        }
        output += " </userInfo>"

        return output
    }

}

extension MomUserInfoEntry: XMLConvertible {

    public var xml: String {
        return "<element key=\"\(key)\" value=\"\(value)\"/>"
    }

}
