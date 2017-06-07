//  Created by Eric Marchand on 07/06/2017.
//  Copyright © 2017 Eric Marchand. All rights reserved.
//

import Foundation

public protocol XMLConvertible {
    var xml: String { get }
}

extension Bool: XMLConvertible {
    public var xml: String {
        return self ? "YES": "NO"
    }
}
