//
//  MomEntity+Equatable.swift
//  MomXML
//
//  Created by anass talii on 12/06/2017.
//  Copyright © 2017 phimage. All rights reserved.
//

import Foundation

extension MomEntity: Equatable {

    public static func == (lhs: MomEntity, rhs: MomEntity) -> Bool {
        if  lhs.name == rhs.name {
            if lhs.attributes.count != rhs.attributes.count {
                return false
            }
            if lhs.relationship.count != rhs.relationship.count {
                return false
            }
            if  lhs.attributes != rhs.attributes {
                return false
            }
            if  lhs.relationship != rhs.relationship {
                return false
            }
            if  lhs.userInfo != rhs.userInfo {
                return false
            }
            return true
        }
        return false
    }
}
