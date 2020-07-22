//  Created by Eric Marchand on 07/06/2017.
//  Copyright © 2017 Eric Marchand. All rights reserved.
//

import Foundation

public struct MomModel {

    public var type = "com.apple.IDECoreDataModeler.DataModel"
    public var documentVersion = "1.0"
    public var lastSavedToolsVersion = "12141"
    public var systemVersion = "16E195"
    public var minimumToolsVersion = "Automatic"
    public var language = "Swift"
    public var userDefinedModelVersionIdentifier = ""

    public var entities: [MomEntity] = []
    public var elements: [MomElement] = []
    public var configurations: [MomConfiguration] = []

    public init() {}
}

extension MomModel {

    public func check() -> Bool {
        if entities.count != elements.count {
            return false
        }
        let hasElementForEntity = entities.map { $0.name }.sorted() == elements.map { $0.name }.sorted()
        if !hasElementForEntity {
            return false
        }
        // XXX could check also inversed relationship coherences
        return true
    }

    public func moveElements() {
        // TODO move elements to not be at same place
    }

    var momEntityByName: [String: MomEntity] {
        return entities.dictionaryBy { $0.name }
    }
}

extension Array {
    /// Create a dictionary from this array.
    ///
    /// - parameter key: A closure to get hashing key from array values.
    ///
    /// - returns: the dictionary
    func dictionaryBy<T: Hashable>(key: (Element) -> T) -> [T: Element] {
        var result: [T: Element] = [:]
        self.forEach {
            let keyValue = key($0)
            result[keyValue] = $0
        }
        return result
    }
}
