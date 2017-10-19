//
//  MomUserInfo+CoreData.swift
//  MomXML
//
//  Created by Eric Marchand on 18/06/2017.
//  Copyright © 2017 phimage. All rights reserved.
//

import Foundation
import CoreData

extension MomUserInfo {

    public var coreData: [AnyHashable: Any]? {
        if isEmpty {
            return nil
        }
        var result = [AnyHashable: Any]()
        for entry in entries {
            result[entry.key] = entry.value
        }
        return result
    }
}
