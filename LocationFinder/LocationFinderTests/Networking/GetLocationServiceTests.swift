//
//  GetLocationServiceTests.swift
//  LocationFinderTests
//
//  Created by Monali on 27/06/22.
//

import XCTest
@testable import LocationFinder

final class GetLocationServiceTests: XCTestCase {
    
    private let session = URLSessionMockFactory.makeSession()
    private let resourcePath = "main/locations.json"

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_request_completesSuccessfully() {
        let endpoint = EndpointMockFactory.makeSuccessfulEndpoint(path: resourcePath)
        let service = StandardNetworkService(session: session, urlRequest: AuthURLRequestFactory(endpoint: endpoint))
        let exp = expectation(description: "Waiting response expectation")
        
        service.get() { (result: Result<locationsResponseModel, Error>) in
            switch result {
            case .success(let players):
                XCTAssertGreaterThan(players.locations.count, 1)
                exp.fulfill()
            case .failure(_):
                XCTFail("Unexpected failure")
            }
        }
        
        wait(for: [exp], timeout: TestConfigurator.defaultTimeout)
    }
    
    func test_request_completesWithError() {
        let endpoint = EndpointMockFactory.makeErrorEndpoint()
        let service = StandardNetworkService(session: session, urlRequest: AuthURLRequestFactory(endpoint: endpoint))
        let exp = expectation(description: "Waiting response expectation")
        
        service.get() { (result: Result<locationsResponseModel, Error>) in
            switch result {
            case .success(_):
                XCTFail("Request should have failed")
            case .failure(_):
                XCTAssertTrue(true)
                exp.fulfill()
            }
        }
        
        wait(for: [exp], timeout: TestConfigurator.defaultTimeout)
    }
        
    func test_request_completesWithTransformModelError() {
        let endpoint = EndpointMockFactory.makeInvalidModelTansformEndpoint()
        let service = StandardNetworkService(session: session, urlRequest: AuthURLRequestFactory(endpoint: endpoint))
        let exp = expectation(description: "Waiting response expectation")
        
        service.get() { (result: Result<[locationsResponseModel], Error>) in
            switch result {
            case .success(_):
                XCTFail("Request should have failed")
            case .failure(_):
                XCTAssertTrue(true)
                exp.fulfill()
            }
        }
        
        wait(for: [exp], timeout: TestConfigurator.defaultTimeout)
    }
    
}

