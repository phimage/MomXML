//  Created by Eric Marchand on 07/06/2017.
//  Copyright © 2017 phimage. All rights reserved.
//

import Foundation

extension MomXML: XMLObject {

    public init?(xml: XML) {
        var hasModel = false
        for child in xml.children {
            if let model = MomModel(xml: child) {
                self.model = model
                hasModel = true
            }
        }
        if !hasModel {
            return nil
        }
        // TODO parse root attributes
    }

}

extension MomXML {
#if swift(>=6.0)
    nonisolated(unsafe) public static var orphanCallback: ((XML, Any) -> Void)?
#else
    public static var orphanCallback: ((XML, Any) -> Void)?
#endif
}
