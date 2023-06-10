//
//  NSCompositeAttributeDescription+MomXml.swift
//
//
//  Created by phimage(Eric Marchand) on 10/06/2023.
//

import Foundation
import CoreData

@available(iOS 17.0, *)
@available(macOS 14.0, *)
extension NSCompositeAttributeDescription {

    public var momComposite: MomCompositeAttribute {
        var mom = MomCompositeAttribute(name: self.name)
        mom.elements = self.elements.compactMap({ $0 as? NSAttributeDescription}).map({ $0.mom })

        // let momAttr = self.mom : TODO parse and set in mom composite?

        return mom
    }

}
