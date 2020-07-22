//
//  NSManagedObjectModel+MomXML.swift
//  MomXML
//
//  Created by Eric Marchand on 09/06/2017.
//  Copyright © 2017 phimage. All rights reserved.
//

import Foundation
import CoreData

extension NSManagedObjectModel {

    public var mom: MomModel {
        var mom = MomModel()

        mom.entities = self.entities.map { $0.mom }
        mom.elements = self.entities.map { $0.momElement }
        mom.configurations = self.configurations.map { MomConfiguration(name: $0, memberEntities: []) }

        for var configuration in mom.configurations {
            if let entities = self.entities(forConfigurationName: configuration.name) {
                configuration.memberEntities = entities.map { MomMemberEntity(name: $0.name ?? "") }
            }
        }
        return mom
    }

    public var momXml: MomXML {
        var xml = MomXML()
        xml.model = self.mom
        return xml
    }

}
