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
        return "<entry key=\"\(key)\" value=\"\(value.xmlSimpleEscape)\"/>"
    }

}

extension String {

    private typealias SimpleToFromRepalceList = [(fromSubString: String, toSubString: String)]
    private static let xmlUnescapeMapList: SimpleToFromRepalceList = [
        ("&amp;", "&"),
        ("&quot;", "\""),
        ("&#x27;", "'"),
        ("&#39;", "'"),
        ("&#x92;", "'"),
        ("&#x96;", "-"),
        ("&gt;", ">"),
        ("&lt;", "<")]
    private static let xmlEscapeMapList: SimpleToFromRepalceList = [
        ("&", "&amp;"),
        ("\"", "&quot;"),
        ("'", "&#x27;"),
        (">", "&gt;"),
        ("<", "&lt;")]

    private func simpleReplace(_ mapList: SimpleToFromRepalceList ) -> String {
        var string = self
        for (fromStr, toStr) in mapList {
            let separatedList = string.components(separatedBy: fromStr)
            if separatedList.count > 1 {
                string = separatedList.joined(separator: toStr)
            }
        }
        return string
    }

    var xmlSimpleUnescape: String {
        return self.simpleReplace(String.xmlUnescapeMapList)
    }

    var xmlSimpleEscape: String {
        return self.simpleReplace(String.xmlEscapeMapList)
    }
}
