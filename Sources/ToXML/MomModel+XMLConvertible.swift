//  Created by Eric Marchand on 07/06/2017.
//  Copyright © 2017 Eric Marchand. All rights reserved.
//

import Foundation

extension MomModel: XMLConvertible {

    public var xml: String {
        var output = "<model type=\"\(type)\" documentVersion=\"\(documentVersion)\""
        output += " lastSavedToolsVersion=\"\(lastSavedToolsVersion)\" systemVersion=\"\(systemVersion)\""
        output += " minimumToolsVersion=\"\(minimumToolsVersion)\" sourceLanguage=\"\(language)\""
        output += " userDefinedModelVersionIdentifier=\"\(userDefinedModelVersionIdentifier)\">\n"

        for entity in entities {
            output += entity.xml
            output += "\n"
        }

        if elements.isEmpty {
            output += "<elements/>"
        } else {
            output += " <elements>\n"
            for element in elements {
                output += element.xml
                output += "\n"
            }
            output += " </elements>\n"
        }
        output += "</model>\n"
        return output
    }

}
