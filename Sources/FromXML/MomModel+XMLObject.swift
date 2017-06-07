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

        for xml in xml.children {
            if let entity = MomEntity(xml: xml) {
                self.entities.append(entity)
            } else if let element = MomElement(xml: xml) {
                self.elements.append(element)
            }
        }
    }

}
