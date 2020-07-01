//
//  MomUniquenessConstraints+Equatable.swift
//  
//
//  Created by Eric Marchand on 01/07/2020.
//

import Foundation

extension MomUniquenessConstraints: Equatable {

    public static func == (lhs: MomUniquenessConstraints, rhs: MomUniquenessConstraints) -> Bool {
        if lhs.constraints.count != rhs.constraints.count {
            return false
        }
        return lhs.constraints == rhs.constraints
    }
}

extension MomUniquenessConstraint: Equatable {

    public static func == (lhs: MomUniquenessConstraint, rhs: MomUniquenessConstraint) -> Bool {
        if lhs.constraints.count != rhs.constraints.count {
            return false
        }
        return lhs.constraints == rhs.constraints
    }
}

extension MomConstraint: Equatable {
    public static func == (lhs: MomConstraint, rhs: MomConstraint) -> Bool {
        return lhs.value == rhs.value
    }
}
