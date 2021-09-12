import Foundation

extension MomConfiguration: XMLObject {

    public init?(xml: XML?) {
        guard let xml = xml else { return nil }
        guard let element = xml.element, element.name == "configuration" else {
            return nil
        }
        guard let name = element.attribute(by: "name")?.text else {
                return nil
        }
        var memberEntities: [MomMemberEntity] = []
        for child in xml.children ?? [] {
            if let object = MomMemberEntity(xml: child) {
                memberEntities.append(object)
            } else {
                MomXML.orphanCallback?(xml, MomMemberEntity.self)
            }
        }
        self.init(name: name, memberEntities: memberEntities)
    }

}

extension MomMemberEntity: XMLObject {

    public init?(xml: XML?) {
        guard let xml = xml else { return nil }
        guard let element = xml.element, element.name == "memberEntity" else {
            return nil
        }
        guard let name = element.attribute(by: "name")?.text else {
                return nil
        }
        self.init(name: name)
    }

}
