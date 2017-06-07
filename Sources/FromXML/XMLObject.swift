//  Created by Eric Marchand on 07/06/2017.
//  Copyright © 2017 phimage. All rights reserved.
//

import Foundation
import SWXMLHash

public typealias XML = XMLIndexer

public protocol XMLObject {

    init?(xml: XML)

}

extension String {

    var toInt: Int? {
        return Int(self)
    }
    var toBool: Bool? {
        return Bool(self)
    }
}
