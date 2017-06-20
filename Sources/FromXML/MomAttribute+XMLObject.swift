//  Created by Eric Marchand on 07/06/2017.
//  Copyright © 2017 Eric Marchand. All rights reserved.
//

import Foundation

extension MomAttribute: XMLObject {

    public init?(xml: XML) {
        guard let element = xml.element, element.name == "attribute" else {
            return nil
        }
        guard let name = element.attribute(by: "name")?.text,
        let attributeTypeString = element.attribute(by: "attributeType")?.text,
        let attributeType = AttributeType(rawValue: attributeTypeString) else {
            return nil
        }
        self.init(name: name, attributeType: attributeType)

        self.isOptional = xml.element?.attribute(by: "optional")?.text.toBool ?? false
        self.usesScalarValueType = xml.element?.attribute(by: "usesScalarValueType")?.text.toBool ?? false
        self.isIndexed = xml.element?.attribute(by: "indexed")?.text.toBool ?? false
        self.isTransient = xml.element?.attribute(by: "transient")?.text.toBool ?? false
        self.syncable = xml.element?.attribute(by: "syncable")?.text.toBool ?? false

        self.defaultValueString = xml.element?.attribute(by: "defaultValueString")?.text
        self.defaultDateTimeInterval = xml.element?.attribute(by: "defaultDateTimeInterval")?.text
        self.minValueString = xml.element?.attribute(by: "minValueString")?.text
        self.maxValueString = xml.element?.attribute(by: "maxValueString")?.text

        for xml in xml.children {
            if let object = MomUserInfo(xml: xml) {
                userInfo = object
            }
        }
    }

}
