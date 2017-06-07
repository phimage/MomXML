//
//  MomXMLTests.swift
//  MomXMLTests
//
//  Created by Eric Marchand on 07/06/2017.
//  Copyright © 2017 phimage. All rights reserved.
//

import XCTest
@testable import MomXML
import SWXMLHash

class MomXMLTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testCreateReadEmpty() {
        let mom = MomXML()

        let xmlString = mom.xml
        XCTAssertFalse(xmlString.isEmpty)
        
        let xml = SWXMLHash.parse(xmlString)

        let parsedMom = MomXML(xml: xml)
        XCTAssertNotNil(parsedMom)

        XCTAssertEqual(parsedMom!.xml, xmlString)
    }

}
