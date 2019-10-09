//
//  MomFetchIndex+XMLConvertible.swift
//  MomXML
//
//  Created by Eric Marchand on 09/10/2019.
//  Copyright © 2019 phimage. All rights reserved.
//

import Foundation

extension MomFetchIndex: XMLConvertible {

    public var xml: String {
        var output = ""
        if isEmpty {
            output += " <fetchIndex name=\"\(self.name)\"/>\n"
        } else {
            output += " <fetchIndex name=\"\(self.name)\">\n"
            for element in elements {
                output += element.xml
                output += "\n"
            }
            output += " </fetchIndex>"
        }

        return output
    }

}

extension MomFetchIndexElement: XMLConvertible {

    public var xml: String {
        if let property = property {
            return "<fetchIndexElement property=\"\(property)\" type=\"\(type)\" order=\"\(order)\"/>"
        } else if let expression = expression, let expressionType = expressionType {
            return "<fetchIndexElement expression=\"\(expression)\" expressionType=\"\(expressionType.xml)\" type=\"\(type)\" order=\"\(order)\"/>"
        } else {
            // must not occurs
            return "<fetchIndexElement type=\"\(type)\" order=\"\(order)\"/>"
        }
    }

}
