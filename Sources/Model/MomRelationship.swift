//  Created by Eric Marchand on 07/06/2017.
//  Copyright © 2017 Eric Marchand. All rights reserved.
//

import Foundation

public struct MomRelationship {

    public var name: String
    public var isOptional: Bool
    public var isOrdered: Bool
    public var isTransient: Bool

    public var isToMany: Bool
    public var maxCount: Int?
    public var minCount: Int?

    public var deletionRule: DeletionRule = .nullify

    public var destinationEntity: String

    public var syncable: Bool = true

    public var inverseName: String?
    public var inverseEntity: String?

    public var userInfo = MomUserInfo()

    public init(name: String, destinationEntity: String, isToMany: Bool = false, isOrdered: Bool = false, isOptional: Bool = false, isTransient: Bool = false) {
        self.name = name
        self.isToMany = isToMany
        self.isOrdered = isOrdered
        self.isOptional = isOptional
        self.isTransient = isTransient
        self.destinationEntity = destinationEntity
    }

    public enum DeletionRule: String {
        case cascade = "Cascade"
        case nullify = "Nulliffy"
        case noAction = "No Action"
        case deny = "Deny"
    }

}
