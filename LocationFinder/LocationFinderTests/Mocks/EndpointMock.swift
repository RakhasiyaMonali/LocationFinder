//
//  EndpointMock.swift
//  LocationFinderTests
//
//  Created by Monali on 27/06/22.
//

import Foundation
@testable import LocationFinder

struct EndpointMock: Endpoint {
    var path: String
    var queryItems: [URLQueryItem]? = nil
    var scheme: String? = "https"
    var host: String? = "raw.githubusercontent.com"

    init(path: String) {
        self.path = path
    }
}

enum URLSessionMockFactory {
    static func makeSession() -> URLSession {
        let urlSession = URLSession(configuration: .ephemeral)
        return urlSession
    }
}

enum EndpointMockFactory {
    static func makeSuccessfulEndpoint(path: String) -> EndpointMock {
        let routePath = "\(path)"
        return EndpointMock(path: routePath)
    }
    
    static func makeErrorEndpoint() -> EndpointMock {
        let routePath = "/api/server-error"
        return EndpointMock(path: routePath)
    }
    
    static func makeEmptyResponseEndpoint() -> EndpointMock {
        let routePath = "/api/empty"
        return EndpointMock(path: routePath)
    }
    
    static func makeInvalidModelTansformEndpoint() -> EndpointMock {
        let routePath = "/api/model-transform-error"
        return EndpointMock(path: routePath)
    }
    
    static func makeUnexpectedStatusCodeCreateEndpoint() -> EndpointMock {
        let routePath = "/api/invalid-status-code"
        return EndpointMock(path: routePath)
    }
    
    static func makeLocationHeaderNotFoundEndpoint() -> EndpointMock {
        let routePath = "/api/location-not-found"
        return EndpointMock(path: routePath)
    }

}
