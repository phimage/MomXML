//
//  MomRelationship+Equatable.swift
//  MomXML
//
//  Created by anass talii on 12/06/2017.
//  Copyright © 2017 phimage. All rights reserved.
//

import Foundation

extension MomRelationship: Equatable {
    public static func == (lhs: MomRelationship, rhs: MomRelationship) -> Bool {
        return lhs.name == rhs.name && lhs.isToMany == rhs.isToMany && lhs.isOrdered == rhs.isOrdered
            && lhs.isOptional == rhs.isOptional && lhs.destinationEntity == rhs.destinationEntity
            && lhs.deletionRule == rhs.deletionRule && lhs.syncable == rhs.syncable
            && lhs.inverseName == rhs.inverseName && lhs.inverseEntity == rhs.inverseEntity
            && lhs.maxCount == rhs.maxCount && lhs.minCount == rhs.minCount
    }
}
