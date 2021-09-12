//
//  MomUniquenessConstraints+XML.swift
//  
//
//  Created by Eric Marchand on 01/07/2020.
//

import Foundation

extension MomUniquenessConstraints: XMLObject {

    public init?(xml: XML?) {
        guard let xml = xml else { return nil }
        guard let element = xml.element, element.name == "uniquenessConstraints" else {
            return nil
        }

        for child in xml.children ?? [] {
            if let entry = MomUniquenessConstraint(xml: child) {
                self.constraints.append(entry)
            } else {
                MomXML.orphanCallback?(xml, MomUniquenessConstraint.self)
            }
        }
    }

}

extension MomUniquenessConstraint: XMLObject {

    public init?(xml: XML?) {
        guard let xml = xml else { return nil }
        guard let element = xml.element, element.name == "uniquenessConstraint" else {
            return nil
        }
        for child in xml.children ?? [] {
            if let entry = MomConstraint(xml: child) {
                self.constraints.append(entry)
            } else {
                MomXML.orphanCallback?(xml, MomConstraint.self)
            }
        }
    }

}

extension MomConstraint: XMLObject {

    public init?(xml: XML?) {
        guard let xml = xml else { return nil }
        guard let element = xml.element, element.name == "constraint" else {
            return nil
        }
        guard let value = element.attribute(by: "value")?.text else {
            return nil
        }
        self.init(value: value)
    }

}
