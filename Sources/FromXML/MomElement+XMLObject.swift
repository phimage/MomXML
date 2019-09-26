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
            let positionX = element.attribute(by: "positionX")?.text.fromXMLToInt,
            let positionY = element.attribute(by: "positionY")?.text.fromXMLToInt,
            let width = element.attribute(by: "width")?.text.fromXMLToInt else {
                return nil
        }
        let height = element.attribute(by: "height")?.text.fromXMLToInt ?? 0 //optional
        self.init(name: name, positionX: positionX, positionY: positionY, width: width, height: height)
    }

}
