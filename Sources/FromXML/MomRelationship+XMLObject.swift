//  Created by Eric Marchand on 07/06/2017.
//  Copyright © 2017 Eric Marchand. All rights reserved.
//

import Foundation

extension MomRelationship: XMLObject {

    public init?(xml: XML) {
        guard let element = xml.element, element.name == "relationship" else {
            return nil
        }

        guard let name = element.attribute(by: "name")?.text,
            let destinationEntity = element.attribute(by: "destinationEntity")?.text else {
                return nil
        }
        self.init(name: name, destinationEntity: destinationEntity)

        self.syncable = xml.element?.attribute(by: "syncable")?.text.toBool ?? false
        self.isOptional = xml.element?.attribute(by: "optional")?.text.toBool ?? false
        self.isToMany = xml.element?.attribute(by: "toMany")?.text.toBool ?? false
        self.isOrdered = xml.element?.attribute(by: "ordered")?.text.toBool ?? false
        self.isTransient = xml.element?.attribute(by: "transient")?.text.toBool ?? false

        if let text = xml.element?.attribute(by: "ordered")?.text, let rule = DeletionRule(rawValue: text) {
            self.deletionRule = rule
        }

        self.maxCount = xml.element?.attribute(by: "maxCount")?.text.toInt
        self.minCount = xml.element?.attribute(by: "minCount")?.text.toInt

        self.inverseName = xml.element?.attribute(by: "inverseName")?.text
        self.inverseEntity = xml.element?.attribute(by: "inverseEntity")?.text

        for xml in xml.children {
            if let object = MomUserInfo(xml: xml) {
                userInfo = object
            } else {
                MomXML.orphanCallback?(xml, MomUserInfo.self)
            }
        }
    }

}
