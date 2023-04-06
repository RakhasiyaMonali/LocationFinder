//
//  ValidatorsTests.swift
//  LocationFinderTests
//
//  Created by Monali on 27/06/22.
//

import XCTest
@testable import LocationFinder

class ValidatorsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testRequiredFieldValidator() {
        let validator = RequiredFieldValidator("Test Field")
        let emptyField = try? validator.validated("")
        XCTAssertNil(emptyField)
        
        let validField = try? validator.validated("valid field")
        XCTAssertEqual("valid field", validField)
    }
    
}
