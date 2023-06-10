//
//  MomCompositeAttribute.swift
//  
//
//  Created by phimage(Eric Marchand) on 10/06/2023.
//

import Foundation

public struct MomCompositeAttribute { // inherit from MomAttribute?

    public var name: String
    public var elements: [MomAttribute] = []

    public init(name: String, elements: [MomAttribute] = []) {
        self.name = name
        self.elements = elements
    }

}
