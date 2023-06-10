//
//  MomCompositeAttribute+XMLObject.swift
//
//
//  Created by phimage(Eric Marchand) on 10/06/2023.
//

import Foundation

extension MomCompositeAttribute: XMLObject {

    public init?(xml: XML) {
        guard let element = xml.element, element.name == "composite" else {
            return nil
        }
        guard let name = element.attribute(by: "name")?.text else {
                return nil
        }

        self.init(name: name)

        for xml in xml.children {
            if let object = MomAttribute(xml: xml) {
                self.elements.append(object)
            } else {
                MomXML.orphanCallback?(xml, [MomAttribute.self, MomRelationship.self, MomUserInfo.self, MomFetchedProperty.self, MomFetchIndex.self, MomUniquenessConstraints.self])
            }
        }

    }

}
