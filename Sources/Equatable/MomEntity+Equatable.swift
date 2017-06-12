//
//  MomEntity+Equatable.swift
//  MomXML
//
//  Created by anass talii on 12/06/2017.
//  Copyright © 2017 phimage. All rights reserved.
//

import Foundation

extension MomEntity: Equatable {
    
    /*public static func == (lhs: MomEntity, rhs: MomEntity) -> Bool {
        if (lhs.name == rhs.name){
            if lhs.attributes.count != rhs.attributes.count {
                return false
            }
            if lhs.relationship.count != rhs.relationship.count {
                return false
            }
            
            for entry in lhs.attributes {
                var found = false
                for entry2 in rhs.attributes where entry2.name == entry.name {
                    if entry2.attributeType.rawValue != entry.attributeType.rawValue {
                        return false
                    }
                    found = true
                    break
                }
                if !found {
                    return false
                }
            }
            for entry in lhs.relationship {
                var found = false
                for entry2 in rhs.relationship where entry2.name == entry.name {
                    if entry2.destinationEntity != entry.destinationEntity {
                        return false
                    }
                    found = true
                    break
                }
                if !found {
                    return false
                }
            }
            
            return true
        }
        return false
    }*/
    public static func == (lhs: MomEntity, rhs: MomEntity) -> Bool {
        if (lhs.name == rhs.name){
            if lhs.attributes.count != rhs.attributes.count {
                return false
            }
            if lhs.relationship.count != rhs.relationship.count {
                return false
            }
            
            for entry in lhs.attributes {
                for entry2 in rhs.attributes where entry2 != entry {
                    return false
                }
            }
            for entry in lhs.relationship {
                for entry2 in rhs.relationship where entry2 == entry {
                    return false
                }
            }
            
            return true
        }
        return false
    }
}
