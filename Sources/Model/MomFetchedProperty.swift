//
//  MomFetchedProperty.swift
//  MomXML
//
//  Created by Eric Marchand on 03/01/2019.
//  Copyright © 2019 phimage. All rights reserved.
//

import Foundation

public struct MomFetchedProperty {

    public var name: String
    public var isOptional: Bool = true
    public var syncable: Bool = true
    public var fetchRequest: MomFetchRequest
    public var userInfo = MomUserInfo()

    public init(name: String, fetchRequest: MomFetchRequest) {
        self.name = name
        self.fetchRequest = fetchRequest
    }
}

public struct MomFetchRequest {

    public var name: String
    public var entity: String
    public var predicateString: String

    public init(name: String, entity: String, predicateString: String) {
        self.name = name
        self.entity = entity
        self.predicateString = predicateString
    }

}
