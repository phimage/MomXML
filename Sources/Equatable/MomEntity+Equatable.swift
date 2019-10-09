//
//  MomEntity+Equatable.swift
//  MomXML
//
//  Created by anass talii on 12/06/2017.
//  Copyright © 2017 phimage. All rights reserved.
//

import Foundation

extension MomEntity: Equatable {

    public static func == (lhs: MomEntity, rhs: MomEntity) -> Bool {
        guard lhs.name == rhs.name else {
            return false
        }
        if lhs.attributes.count != rhs.attributes.count {
            return false
        }
        if lhs.relationship.count != rhs.relationship.count {
            return false
        }
        let lattributes = lhs.attributes.sorted { $0.name < $1.name }
        let rattributes = rhs.attributes.sorted { $0.name < $1.name }
        if lattributes != rattributes {
            return false
        }
        let lrelationship = lhs.relationship.sorted { $0.name < $1.name }
        let rrelationship = rhs.relationship.sorted { $0.name < $1.name }
        if lrelationship != rrelationship {
            return false
        }
        let lfetchProperties = lhs.fetchProperties.sorted { $0.name < $1.name }
        let rfetchProperties = rhs.fetchProperties.sorted { $0.name < $1.name }
        if lfetchProperties != rfetchProperties {
            return false
        }
        let lfetchIndexes = lhs.fetchIndexes.sorted { $0.name < $1.name }
        let rfetchIndexes = rhs.fetchIndexes.sorted { $0.name < $1.name }
        if lfetchIndexes != rfetchIndexes {
            return false
        }
        if lhs.userInfo != rhs.userInfo {
            return false
        }
        return true
    }
}
