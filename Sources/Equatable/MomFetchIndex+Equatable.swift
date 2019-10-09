//
//  MomFetchIndex+Equatable.swift
//  MomXML
//
//  Created by Eric Marchand on 09/10/2019.
//  Copyright © 2019 phimage. All rights reserved.
//

import Foundation

extension MomFetchIndex: Equatable {

    public static func == (lhs: MomFetchIndex, rhs: MomFetchIndex) -> Bool {
        if lhs.name != rhs.name {
            return false
        }
        if lhs.elements.count != rhs.elements.count {
            return false
        }
        return lhs.elements.sorted { $0.orderID < $1.orderID } == rhs.elements.sorted { $0.orderID < $1.orderID }
    }
}

extension MomFetchIndexElement: Equatable {
    public static func == (lhs: MomFetchIndexElement, rhs: MomFetchIndexElement) -> Bool {
        return lhs.property == rhs.property
            && lhs.expression == rhs.expression && lhs.expressionType == rhs.expressionType
            && lhs.type == rhs.type && lhs.order == rhs.order
    }

    fileprivate var orderID: String {
        return self.property ?? self.expression ?? self.type.rawValue // XXX maybe append instead if not nil
    }
}
