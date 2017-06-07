//  Created by Eric Marchand on 07/06/2017.
//  Copyright © 2017 Eric Marchand. All rights reserved.
//

import Foundation

extension MomUserInfo: XMLObject {

    public init?(xml: XML) {
        guard let name = xml.element?.name, name == "userInfo" else {
            return nil
        }

        for child in xml.children {
            if let entry = MomUserInfoEntry(xml: child) {
                self.entries.append(entry)
            }
        }
    }

}

extension MomUserInfoEntry: XMLObject {

    public init?(xml: XML) {
        guard let element = xml.element else {
            return nil
        }
        guard let key = element.attribute(by: "key")?.text,
            let value = element.attribute(by: "value")?.text else {
                return nil
        }
        self.init(key: key, value: value)
    }

}
