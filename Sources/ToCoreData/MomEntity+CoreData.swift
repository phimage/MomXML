//
//  MomEntity+CoreData.swift
//  MomXML
//
//  Created by Eric Marchand on 18/06/2017.
//  Copyright © 2017 phimage. All rights reserved.
//

import Foundation
import CoreData

extension MomEntity {

    public var coreData: NSEntityDescription {
        let coreData = NSEntityDescription()
        coreData.name = self.name
        coreData.userInfo = self.userInfo.coreData
        coreData.properties = self.relationship.map { $0.coreData } + self.attributes.map { $0.coreData }
        if #available(iOS 11.0, OSX 10.13, *) {
            coreData.indexes = self.fetchIndexes.compactMap { $0.coreData(properties: coreData.propertiesByName) }
        }
        return coreData
    }

}
