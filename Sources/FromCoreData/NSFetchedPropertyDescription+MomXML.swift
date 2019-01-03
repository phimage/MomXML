//  Created by Eric Marchand on 03/01/2019.
//  Copyright © 2019 phimage. All rights reserved.
//

import Foundation
import CoreData

extension NSFetchedPropertyDescription {

    public var mom: MomFetchedProperty? {
        guard let fetchRequest = self.fetchRequest else {
            return nil
        }
        var mom = MomFetchedProperty(name: self.name, fetchRequest: NSFetchedPropertyDescription.mom(from: fetchRequest))
        mom.isOptional = self.isOptional
        return mom
    }

    public static func mom(from request: NSFetchRequest<NSFetchRequestResult>) -> MomFetchRequest {
        let mom = MomFetchRequest(name: "", entity: request.entityName ?? "", predicateString: request.predicate?.predicateFormat ?? "")
        return mom
    }

}
