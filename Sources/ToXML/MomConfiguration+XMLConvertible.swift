//
//  File.swift
//  
//
//  Created by Eric Marchand on 22/07/2020.
//

import Foundation

extension MomConfiguration: XMLConvertible {

    public var xml: String {
        var output: String
        if memberEntities.isEmpty {
            output = "<configuration name=\"\(name)\"/>\n"
        } else {
            output = "<configuration name=\"\(name)\">\n"
            for memberEntity in memberEntities {
                output += memberEntity.xml
                output += "\n"
            }
            output += "</configuration>"
        }
        return output
    }

}

extension MomMemberEntity: XMLConvertible {
    public var xml: String {
        return "<memberEntity name=\"\(name)\" />"
    }
}
