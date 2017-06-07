//  Created by Eric Marchand on 07/06/2017.
//  Copyright © 2017 Eric Marchand. All rights reserved.
//

import Foundation

extension MomElement: XMLObject {

    public init?(xml: XML) {
        guard let element = xml.element, element.name == "element" else {
            return nil
        }
        guard let name = element.attribute(by: "name")?.text,
            let positionX = element.attribute(by: "positionX")?.text.toInt,
            let positionY = element.attribute(by: "positionY")?.text.toInt,
            let width = element.attribute(by: "width")?.text.toInt,
            let height = element.attribute(by: "height")?.text.toInt else {
                return nil
        }
        self.init(name: name, positionX: positionX, positionY: positionY, width: width, height: height)
    }

}
