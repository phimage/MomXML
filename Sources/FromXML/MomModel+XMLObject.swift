//  Created by Eric Marchand on 07/06/2017.
//  Copyright © 2017 Eric Marchand. All rights reserved.
//

import Foundation

extension MomModel: XMLObject {

    public init?(xml: XML) {
        guard let element = xml.element, element.name == "model" else {
            return nil
        }

        type = element.attribute(by: "type")?.text ?? type
        documentVersion = element.attribute(by: "documentVersion")?.text ?? documentVersion
        lastSavedToolsVersion = element.attribute(by: "lastSavedToolsVersion")?.text ?? lastSavedToolsVersion
        minimumToolsVersion = element.attribute(by: "minimumToolsVersion")?.text ?? minimumToolsVersion
        userDefinedModelVersionIdentifier = element.attribute(by: "userDefinedModelVersionIdentifier")?.text ?? userDefinedModelVersionIdentifier

        for xmlChildren in xml.children {
            if let entity = MomEntity(xml: xmlChildren) {
                self.entities.append(entity)
            } else if xmlChildren.element?.name == "elements" {
                for xmlSubChildren in xmlChildren.children {
                    if let element = MomElement(xml: xmlSubChildren) {
                        self.elements.append(element)
                    } else {
                        MomXML.orphanCallback?(xmlSubChildren, MomElement.self)
                    }
                }
            } else {
                MomXML.orphanCallback?(xmlChildren, MomEntity.self)
            }
        }
    }

}
