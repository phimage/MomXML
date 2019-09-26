//  Created by Eric Marchand on 07/06/2017.
//  Copyright © 2017 phimage. All rights reserved.
//

import Foundation
#if USESOURCE
#else
    import SWXMLHash
#endif
public typealias XML = XMLIndexer

public protocol XMLObject {

    init?(xml: XML)

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
