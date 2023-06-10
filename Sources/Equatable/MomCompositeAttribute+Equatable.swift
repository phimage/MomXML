//
//  MomCompositeAttribute+Equatable.swift
//
//
//  Created by phimage(Eric Marchand) on 10/06/2023.
//

import Foundation

extension MomCompositeAttribute: Equatable {

    public static func == (lhs: MomCompositeAttribute, rhs: MomCompositeAttribute) -> Bool {
        guard lhs.name == rhs.name else {
            return false
        }
        if lhs.elements.count != rhs.elements.count {
            return false
        }
        let lattributes = lhs.elements.sorted { $0.name < $1.name }
        let rattributes = rhs.elements.sorted { $0.name < $1.name }
        if lattributes != rattributes {
            return false
        }
        return true
    }

}
