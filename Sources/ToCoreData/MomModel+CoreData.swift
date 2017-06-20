//
//  MomModel+CoreData.swift
//  MomXML
//
//  Created by Eric Marchand on 18/06/2017.
//  Copyright © 2017 phimage. All rights reserved.
//

import Foundation
import CoreData

extension MomModel {

    public var coreData: NSManagedObjectModel {
        let coreData = NSManagedObjectModel()
        coreData.entities = self.entities.map { $0.coreData }
        return coreData
    }

}
