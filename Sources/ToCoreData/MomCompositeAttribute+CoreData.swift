//
//  MomAttribute+CoreData.swift
//  MomXML
//
//  Created by Eric Marchand on 18/06/2017.
//  Copyright © 2017 phimage. All rights reserved.
//

import Foundation
import CoreData

extension MomCompositeAttribute {

    @available(macOS 14.0, iOS 17.0, tvOS 17.0, watchOS 10.0, *)
    public var coreData: NSCompositeAttributeDescription {
        let coreData: NSCompositeAttributeDescription = NSCompositeAttributeDescription()
        coreData.name = self.name
        coreData.elements.append(contentsOf: self.elements.map({ $0.coreData }))
        return coreData
    }
}
