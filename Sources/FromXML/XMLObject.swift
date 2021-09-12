//  Created by Eric Marchand on 07/06/2017.
//  Copyright © 2017 phimage. All rights reserved.
//

import Foundation

public typealias XML = XMLNode

public protocol XMLObject {

    init?(xml: XML?)
}

extension String {

    var fromXMLToInt: Int? {
        return Int(self)
    }
    var fromXMLToBool: Bool? {
        if self == "YES" {
            return true
        }
        return Bool(self)
    }
}

// jmj
extension XMLNode {
    var element: XMLElement? {
        self as? XMLElement
    }
    
//    func attribute(by name: String) -> XMLElement {
//        self.attribute(fromName: name)
//    }
}

extension XMLElement {
    var text: String {
        self.stringValue ?? ""
    }

    func attribute(by name: String) -> XMLElement? {
        self.attribute(forName: name) as? XMLElement
    }
}
