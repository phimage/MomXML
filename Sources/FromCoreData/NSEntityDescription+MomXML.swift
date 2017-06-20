//
//  NSEntityDescription+MomXML.swift
//  MomXML
//
//  Created by Eric Marchand on 09/06/2017.
//  Copyright © 2017 phimage. All rights reserved.
//

import Foundation
import CoreData

extension NSEntityDescription {

    public var mom: MomEntity {
        var mom = MomEntity(name: self.name!, representedClassName: self.name!)

        mom.attributes = self.attributesByName.values.map { $0.mom }
        mom.relationship = self.relationshipsByName.values.map { $0.mom }

        if let userInfo = self.userInfo {
            mom.userInfo = MomUserInfo(userInfo: userInfo)
        }

        return mom
    }

    public var momElement: MomElement {
        return MomElement(name: self.name!)
    }

}
