//
//  MomUniquenessConstraints+XMLConvertible.swift
//  
//
//  Created by Eric Marchand on 01/07/2020.
//

import Foundation

extension MomUniquenessConstraints: XMLConvertible {

    public var xml: String {
        var output = ""
        output += " <uniquenessConstraints>\n"
        for entry in constraints {
            output += entry.xml
            output += "\n"
        }
        output += " </uniquenessConstraints>"

        return output
    }

}

extension MomUniquenessConstraint: XMLConvertible {

    public var xml: String {
        var output = ""
        output += " <uniquenessConstraint>\n"
        for entry in constraints {
            output += entry.xml
            output += "\n"
        }
        output += " </uniquenessConstraint>"

        return output
    }

}

extension MomConstraint: XMLConvertible {

    public var xml: String {
        return "<constraint value=\"\(value.xmlSimpleEscape)\"/>"
    }

}
