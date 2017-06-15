//
//  MomUserInfo+Equatable.swift
//  MomXML
//
//  Created by anass talii on 12/06/2017.
//  Copyright © 2017 phimage. All rights reserved.
//

import Foundation

extension MomUserInfo: Equatable {

    public static func == (lhs: MomUserInfo, rhs: MomUserInfo) -> Bool {
        if lhs.entries.count != rhs.entries.count {
            return false
        }
        return lhs.entries.sorted { $0.key < $1.key } == rhs.entries.sorted { $0.key < $1.key }
    }
}

extension MomUserInfoEntry: Equatable {
    public static func == (lhs: MomUserInfoEntry, rhs: MomUserInfoEntry) -> Bool {
        return lhs.key == rhs.key && lhs.value == rhs.value
    }
}
