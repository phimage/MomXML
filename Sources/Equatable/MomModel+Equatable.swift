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
        return lhs.entities.sorted { $0.name < $1.name } == rhs.entities.sorted { $0.name < $1.name } &&
            lhs.elements.sorted { $0.name < $1.name } == rhs.elements.sorted { $0.name < $1.name }
    }
}
