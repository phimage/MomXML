//
//  MomXML+Equatable.swift
//  MomXML
//
//  Created by anass talii on 12/06/2017.
//  Copyright © 2017 phimage. All rights reserved.
//

import Foundation

extension MomXML: Equatable {
    public static func == (lhs: MomXML, rhs: MomXML) -> Bool {
        if (lhs.model. == rhs.name){
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
