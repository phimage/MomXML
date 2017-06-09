//  Created by Eric Marchand on 07/06/2017.
//  Copyright © 2017 Eric Marchand. All rights reserved.
//

import Foundation

public struct MomRelationship {

    var userInfo = MomUserInfo()

    var name: String
    var isOptional: Bool
    var isOrdered: Bool

    var isToMany: Bool
    var maxCount: Int?
    var minCount: Int?

    var deletionRule: DeletionRule = .nullify

    var destinationEntity: String

    var syncable: Bool = true

    var inverseName: String?
    var inverseEntity: String?

    public init(name: String, destinationEntity: String, isToMany: Bool = false, isOrdered: Bool = false, isOptional: Bool = false) {
        self.name = name
        self.isToMany = isToMany
        self.isOrdered = isOrdered
        self.isOptional = isOptional
        self.destinationEntity = destinationEntity
    }

}

extension MomRelationship {

    public enum DeletionRule: String {
        case cascade = "Cascade"
        case nullify = "Nulliffy"
        case noAction = "No Action"
        case deny = "Deny"
    }

}
