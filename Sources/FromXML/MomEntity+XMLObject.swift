//  Created by Eric Marchand on 07/06/2017.
//  Copyright © 2017 Eric Marchand. All rights reserved.
//

import Foundation

extension MomEntity: XMLObject {

    public init?(xml: XML) {
        guard let element = xml.element, element.name == "entity" else {
            return nil
        }
        guard let name = element.attribute(by: "name")?.text,
            let representedClassName = element.attribute(by: "representedClassName")?.text,
            let codeGenerationType = element.attribute(by: "codeGenerationType")?.text else {
                return nil
        }

        self.init(name: name, representedClassName: representedClassName, codeGenerationType: codeGenerationType)

        self.syncable = element.attribute(by: "syncable")?.text.fromXMLToBool ?? false

        for xml in xml.children {
            if let object = MomAttribute(xml: xml) {
                self.attributes.append(object)
            } else if let object = MomRelationship(xml: xml) {
                self.relationship.append(object)
            } else if let object = MomFetchedProperty(xml: xml) {
                self.fetchProperties.append(object)
            } else if let object = MomUserInfo(xml: xml) {
               userInfo = object
            } else {
                MomXML.orphanCallback?(xml, [MomAttribute.self, MomRelationship.self, MomUserInfo.self, MomFetchedProperty.self])
            }
        }

    }
}
