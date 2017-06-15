//
//  MomModel+Equatable.swift
//  MomXML
//
//  Created by anass talii on 12/06/2017.
//  Copyright © 2017 phimage. All rights reserved.
//

import Foundation

extension MomModel: Equatable {

    public static func == (lhs: MomModel, rhs: MomModel) -> Bool {
        if lhs.entities.count != rhs.entities.count {
            return false
        }
        if lhs.elements.count != rhs.elements.count {
            return false
        }
        for entry in lhs.entities {
            for entry2 in rhs.entities where entry2 != entry {
                return false
            }
        }
        for entry in lhs.elements {
            for entry2 in rhs.elements where entry2 != entry {
                return false
            }
        }
        return true
    }
}
