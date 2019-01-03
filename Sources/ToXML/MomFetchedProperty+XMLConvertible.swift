//  Created by Eric Marchand on 03/01/2019.
//  Copyright © 2019 phimage. All rights reserved.
//

import Foundation

extension MomFetchedProperty: XMLConvertible {

    public var xml: String {
        var output = "<fetchedProperty name=\"\(name)\" optional=\"\(isOptional.xml)\" syncable=\"\(syncable.xml)\">\n"

        output += fetchRequest.xml
        output += "\n"
        if !userInfo.isEmpty {
            output += userInfo.xml
            output += "\n"
        }

        output += "</fetchedProperty>"
        return output
    }

}

extension MomFetchRequest: XMLConvertible {
    public var xml: String {
        return "<fetchRequest name=\"\(name)\" entity=\"\(entity)\" predicateString=\"\(predicateString)\"/>"
    }
}
