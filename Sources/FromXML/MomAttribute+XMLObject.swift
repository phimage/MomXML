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

        self.isOptional = element.attribute(by: "optional")?.text.fromXMLToBool ?? false
        self.usesScalarValueType = element.attribute(by: "usesScalarValueType")?.text.fromXMLToBool ?? false
        self.isIndexed = element.attribute(by: "indexed")?.text.fromXMLToBool ?? false
        self.isTransient = element.attribute(by: "transient")?.text.fromXMLToBool ?? false
        self.syncable = element.attribute(by: "syncable")?.text.fromXMLToBool ?? false
        self.isDerived = element.attribute(by: "derived")?.text.fromXMLToBool ?? false

        self.defaultValueString = element.attribute(by: "defaultValueString")?.text
        self.defaultDateTimeInterval = element.attribute(by: "defaultDateTimeInterval")?.text
        self.minValueString = element.attribute(by: "minValueString")?.text
        self.maxValueString = element.attribute(by: "maxValueString")?.text
        self.derivationExpression = element.attribute(by: "derivationExpression")?.text

        for xml in xml.children {
            if let object = MomUserInfo(xml: xml) {
                userInfo = object
            } else {
                MomXML.orphanCallback?(xml, MomUserInfo.self)
            }
        }
    }

}
