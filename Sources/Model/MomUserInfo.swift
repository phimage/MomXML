//  Created by Eric Marchand on 07/06/2017.
//  Copyright © 2017 Eric Marchand. All rights reserved.
//

import Foundation

public struct MomUserInfo {

    public var entries: [MomUserInfoEntry] = []

    public mutating func add(key: String, value: String) {
        entries.append(MomUserInfoEntry(key: key, value: value))
    }

    public var isEmpty: Bool {
        return entries.isEmpty
    }

    public init() {}

    public init(userInfo: [AnyHashable: Any]) {
        entries = userInfo.map { MomUserInfoEntry(key: "\($0.key)", value: "\($0.value)") }
    }
}

public struct MomUserInfoEntry {

    public var key: String
    public var value: String

}
