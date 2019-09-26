//
//  MomAttribute+Equatable.swift
//  MomXML
//
//  Created by anass talii on 12/06/2017.
//  Copyright © 2017 phimage. All rights reserved.
//

import Foundation

extension MomAttribute: Equatable {
    public static func == (lhs: MomAttribute, rhs: MomAttribute) -> Bool {
        return lhs.name == rhs.name
            && lhs.isOptional == rhs.isOptional
            && lhs.isTransient == rhs.isTransient
            && lhs.attributeType.rawValue == rhs.attributeType.rawValue
    }
}
