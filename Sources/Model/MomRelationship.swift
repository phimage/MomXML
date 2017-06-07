//  Created by Eric Marchand on 07/06/2017.
//  Copyright © 2017 Eric Marchand. All rights reserved.
//

import Foundation

public struct MomRelationship {

    var userInfo = MomUserInfo()

    var name: String
    var optional: Bool
    var ordered: Bool

    var toMany: Bool
    var maxCount: Int?
    var minCount: Int?

    var deletionRule: DeletionRule = .nullify

    var destinationEntity: String

    var syncable: Bool = true

    var inverseName: String?
    var inverseEntity: String?

    public init(name: String, destinationEntity: String, toMany: Bool = false, ordered: Bool = false, optional: Bool = false) {
        self.name = name
        self.toMany = toMany
        self.ordered = ordered
        self.optional = optional
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
