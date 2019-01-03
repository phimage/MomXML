//  Created by Eric Marchand on 03/01/2019.
//  Copyright © 2019 phimage. All rights reserved.
//

import Foundation
import CoreData

extension MomFetchedProperty {

    public var coreData: NSFetchedPropertyDescription {
        let coreData = NSFetchedPropertyDescription()
        coreData.name = self.name
        coreData.isOptional = self.isOptional
        coreData.fetchRequest = self.fetchRequest.coreData

        return coreData
    }

}

extension MomFetchRequest {

    public var coreData: NSFetchRequest<NSFetchRequestResult> {
        let result = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        result.predicate = NSPredicate(format: predicateString)
        return result
    }
}
