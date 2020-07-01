//
//  MomUniquenessConstraints.swift
//  
//
//  Created by Eric Marchand on 01/07/2020.
//

import Foundation

import CoreData

extension MomUniquenessConstraints {

    public var coreData: [[String]] {
        return self.constraints.map { $0.coreData }
    }

}

extension MomUniquenessConstraint {

    public var coreData: [String] {
        return self.constraints.map { $0.coreData }
    }

}

extension MomConstraint {

    public var coreData: String {
        return self.value
    }

}
