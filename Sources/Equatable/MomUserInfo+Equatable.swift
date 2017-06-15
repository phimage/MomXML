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
        // compare
        for entry in lhs.entries {
            var found = false
            for entry2 in rhs.entries where entry2.key == entry.key {
                    if entry2.value != entry.value {
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
}

extension MomUserInfoEntry: Equatable {
    public static func == (lhs: MomUserInfoEntry, rhs: MomUserInfoEntry) -> Bool {
        return lhs.key == rhs.key && lhs.value == rhs.value
    }
}
