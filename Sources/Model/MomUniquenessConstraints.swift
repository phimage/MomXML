//
//  MomUniquenessConstraints.swift
//  MomXML
//
//  Created by Eric Marchand on 01/07/2020.
//  Copyright © 2020 phimage. All rights reserved.
//

import Foundation

public struct MomUniquenessConstraints {

    public var constraints: [MomUniquenessConstraint] = []

    public mutating func add(constraint: MomUniquenessConstraint) {
        self.constraints.append(constraint)
    }

    public var isEmpty: Bool {
        return constraints.isEmpty
    }

    public init(uniquenessConstraints: [[Any]] = []) {
        self.constraints = uniquenessConstraints.compactMap { MomUniquenessConstraint(constraints: $0) }
    }

}

public struct MomUniquenessConstraint {

    public var constraints: [MomConstraint] = []
    public init() {}

    public init?(constraints: [Any]) {
        self.constraints = constraints.compactMap { MomConstraint(any: $0) }
        if self.constraints.isEmpty {
            return nil
        }
    }

}

public struct MomConstraint {
    public var value: String
    public init(value: String) {
        self.value = value
    }
    public init?(any: Any) {
        guard let value = any as? String else {
            return nil
        }
        self.value = value
     }
}
