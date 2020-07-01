//  Created by Eric Marchand on 09/06/2017.
//  Copyright © 2017 phimage. All rights reserved.
//

import Foundation
import CoreData

extension NSEntityDescription {

    public var mom: MomEntity {
        var mom = MomEntity(name: self.name!, representedClassName: self.name!)

        mom.attributes = self.attributesByName.values.map { $0.mom }
        mom.relationship = self.relationshipsByName.values.map { $0.mom }
        mom.fetchProperties = self.fetchedProperties.compactMap { $0.mom }

        if let userInfo = self.userInfo {
            mom.userInfo = MomUserInfo(userInfo: userInfo)
        }
        if #available(iOS 9.0, OSX 10.11, *) {
            mom.uniquenessConstraints = MomUniquenessConstraints(uniquenessConstraints: self.uniquenessConstraints)
        }
        return mom
    }

    public var momElement: MomElement {
        return MomElement(name: self.name!)
    }

    var fetchedProperties: [NSFetchedPropertyDescription] {
        var result: [NSFetchedPropertyDescription] = []
        for property in self.properties {
            if let property = property as? NSFetchedPropertyDescription {
                result.append(property)
            }
        }
        return result
    }

}
