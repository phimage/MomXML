//  Created by Eric Marchand on 07/06/2017.
//  Copyright © 2017 Eric Marchand. All rights reserved.
//

import Foundation

public struct MomElement {

    public var name: String
    public var positionX: Int = 0
    public var positionY: Int = 0
    public var width: Int = 128
    public var height: Int = 128

    public init(name: String, positionX: Int = 0, positionY: Int = 0, width: Int = 0, height: Int = 0) {
        self.name = name
        self.positionX = positionX
        self.positionY = positionY
        self.width = width
        self.height = height
    }

}
