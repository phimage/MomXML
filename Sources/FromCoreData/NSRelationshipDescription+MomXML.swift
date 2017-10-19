//
//  NSRelationshipDescription+MomXML.swift
//  MomXML
//
//  Created by Eric Marchand on 09/06/2017.
//  Copyright © 2017 phimage. All rights reserved.
//

import Foundation
import CoreData

extension NSRelationshipDescription {

    public var mom: MomRelationship {
        let destination = self.destinationEntity!.name!
        var mom = MomRelationship(name: self.name, destinationEntity: destination)

        if self.maxCount > 0 {
            mom.maxCount = self.maxCount
        }
        if self.minCount > 0 {
            mom.minCount = self.minCount
        }
        mom.isToMany = self.isToMany
        mom.isOrdered = self.isOrdered
        mom.isOptional = self.isOptional
        mom.isTransient = self.isTransient
        mom.deletionRule = self.deleteRule.mom

        if let userInfo = self.userInfo {
            mom.userInfo = MomUserInfo(userInfo: userInfo)
        }

        if let inverseRelationship = self.inverseRelationship {
            mom.inverseName =  inverseRelationship.name

            if self.destinationEntity != nil {
                let destination = self.destinationEntity!.name!
                mom.inverseEntity = destination
            }
        }

        return mom
    }

}

extension NSDeleteRule {

    public var mom: MomRelationship.DeletionRule {
        switch self {
        case .noActionDeleteRule:
            return .noAction
        case .nullifyDeleteRule:
            return .nullify
        case .cascadeDeleteRule:
            return .cascade
        case .denyDeleteRule:
            return .deny
        }
    }
}
