//  Created by Eric Marchand on 03/01/2019.
//  Copyright © 2019 phimage. All rights reserved.
//

import Foundation

extension MomFetchedProperty: Equatable {

    public static func == (lhs: MomFetchedProperty, rhs: MomFetchedProperty) -> Bool {
        guard lhs.name == rhs.name else {
            return false
        }
        guard lhs.isOptional == rhs.isOptional else {
            return false
        }
        guard lhs.syncable == rhs.syncable else {
            return false
        }
        guard lhs.userInfo == rhs.userInfo else {
            return false
        }
        guard lhs.fetchRequest == rhs.fetchRequest else {
            return false
        }
        return true
    }
}

extension MomFetchRequest: Equatable {

    public static func == (lhs: MomFetchRequest, rhs: MomFetchRequest) -> Bool {
        guard lhs.name == rhs.name else {
            return false
        }
        guard lhs.entity == rhs.entity else {
            return false
        }
        guard lhs.predicateString == rhs.predicateString else {
            return false
        }
        return true
    }

}
