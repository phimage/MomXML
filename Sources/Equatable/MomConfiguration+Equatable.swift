//
//  MomConfiguration+Equatable.swift
//  
//
//  Created by Eric Marchand on 22/07/2020.
//

import Foundation

extension MomConfiguration: Equatable {

    public static func == (lhs: MomConfiguration, rhs: MomConfiguration) -> Bool {
        guard lhs.name == rhs.name else {
            return false
        }
        return lhs.memberEntities == rhs.memberEntities
    }

}

extension MomMemberEntity: Equatable {

    public static func == (lhs: MomMemberEntity, rhs: MomMemberEntity) -> Bool {
        return lhs.name == rhs.name
    }

}
