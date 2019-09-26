//  Created by Eric Marchand on 03/01/2019.
//  Copyright © 2019 phimage. All rights reserved.
//

import Foundation

extension MomFetchedProperty: XMLObject {

    public init?(xml: XML) {
        guard let element = xml.element, element.name == "fetchedProperty" else {
            return nil
        }
        guard let fetchRequest = xml.children.compactMap({ MomFetchRequest(xml: $0) }).first else {
            return nil
        }
        guard let name = element.attribute(by: "name")?.text else {
                return nil
        }
        self.init(name: name, fetchRequest: fetchRequest)

        self.isOptional = element.attribute(by: "optional")?.text.fromXMLToBool ?? false
        self.syncable = element.attribute(by: "syncable")?.text.fromXMLToBool ?? false

        for child in xml.children {
            if MomFetchRequest(xml: child) != nil {
                // ignore
            } else if let object = MomUserInfo(xml: xml) {
                userInfo = object
            } else {
                MomXML.orphanCallback?(xml, MomUserInfo.self)
            }
        }
    }

}

extension MomFetchRequest: XMLObject {

    public init?(xml: XML) {
        guard let element = xml.element, element.name == "fetchRequest" else {
            return nil
        }
        guard let name = element.attribute(by: "name")?.text,
            let entity = element.attribute(by: "entity")?.text,
            let predicateString = element.attribute(by: "predicateString")?.text else {
                return nil
        }
        self.init(name: name, entity: entity, predicateString: predicateString)
    }

}
