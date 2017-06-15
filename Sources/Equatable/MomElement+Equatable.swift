//
//  MomElement+Equatable.swift
//  MomXML
//
//  Created by anass talii on 12/06/2017.
//  Copyright © 2017 phimage. All rights reserved.
//

import Foundation

extension MomElement: Equatable {
    public static func == (lhs: MomElement, rhs: MomElement) -> Bool {
        return lhs.name == rhs.name && lhs.positionX == rhs.positionX && lhs.positionY == rhs.positionY && lhs.width == rhs.width && lhs.height == rhs.height
    }
}
