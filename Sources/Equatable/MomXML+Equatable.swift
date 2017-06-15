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
        return lhs.model == rhs.model
    }
}
