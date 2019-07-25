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

        let momEntityByName: [String: MomEntity] = self.momEntityByName

        var coreDataEntitiesByName: [String: NSEntityDescription] = coreData.entitiesByName
        for (name, coreDataEntity) in coreDataEntitiesByName {
            let momEntity: MomEntity? = momEntityByName[name]

            let coreDataRelationshipsByName: [String: NSRelationshipDescription] = coreDataEntity.relationshipsByName

            let relationshipByName: [String: MomRelationship]? = momEntity?.relationshipByName

            for (name, coreDataRelation) in coreDataRelationshipsByName {
              let momRelationship: MomRelationship? = relationshipByName?[name]

                if let destinationName = momRelationship?.destinationEntity, let destinationEntity = coreDataEntitiesByName[destinationName] {
                    coreDataRelation.destinationEntity = destinationEntity

                    let coreDataInverseRelationships = destinationEntity.relationshipsByName

                    if let inverseRelationshipName = momRelationship?.inverseName, let coreDataInverseRelationship = coreDataInverseRelationships[inverseRelationshipName] {
                        coreDataRelation.inverseRelationship = coreDataInverseRelationship
                    }
                }

            }
        }

        return coreData
    }

}
