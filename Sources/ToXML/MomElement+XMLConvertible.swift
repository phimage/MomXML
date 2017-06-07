//  Created by Eric Marchand on 07/06/2017.
//  Copyright © 2017 Eric Marchand. All rights reserved.
//

import Foundation

extension MomElement: XMLConvertible {

    public var xml: String {
        return "<element name=\"\(name)\" positionX=\"\(positionX)\" positionY=\"\(positionY)\" width=\"\(width)\" height=\"\(height)\"/>"
    }

}
