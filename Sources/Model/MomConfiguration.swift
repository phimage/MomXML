//
//  MomConfiguration.swift
//  
//
//  Created by Eric Marchand on 22/07/2020.
//

import Foundation

public struct MomConfiguration {

    public var name: String
    public var memberEntities: [MomMemberEntity]

    public init(name: String, memberEntities: [MomMemberEntity]) {
        self.name = name
        self.memberEntities = memberEntities
    }
}

public struct MomMemberEntity {

    public var name: String

    public init(name: String) {
        self.name = name
    }

}
