//  Created by Eric Marchand on 07/06/2017.
//  Copyright © 2017 phimage. All rights reserved.
//

import Foundation

extension MomXML: XMLConvertible {

    public var xml: String {
        var output = "<?xml version=\"\(version)\" encoding=\"\(encoding)\" standalone=\"\(standalone)\"?>\n"
        output += model.xml
        return output
    }

}
