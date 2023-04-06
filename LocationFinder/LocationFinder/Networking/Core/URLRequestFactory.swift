//
//  URLRequestFactory.swift
//  LocationFinder
//
//  Created by Monali on 23/06/22.
//

import Foundation

// MARK: - ServiceRequest
protocol URLRequestFactory {
    func makeURLRequest() -> URLRequest
    var defaultHeaders: [String: String] { get }
    var endpoint: Endpoint { get set }
}

extension URLRequestFactory {
    var defaultHeaders: [String: String] {
        return ["Content-Type": "application/json", "Accept": "application/json"]
    }
}

// MARK: - Default URL request factory
struct StandardURLRequestFactory: URLRequestFactory {
    var endpoint: Endpoint
    
    func makeURLRequest() -> URLRequest {
        guard let url = endpoint.url else {
            fatalError("Unable to make url request")
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.allHTTPHeaderFields = defaultHeaders
        
        return urlRequest
    }
}

// MARK: - AuthURLRequestFactory
struct AuthURLRequestFactory: URLRequestFactory {
    var endpoint: Endpoint
    
    init(endpoint: Endpoint) {
        self.endpoint = endpoint
    }
    
    func makeURLRequest() -> URLRequest {
        guard let url = endpoint.url else {
            fatalError("Unable to make url request")
        }
        
        let urlRequest = URLRequest(url: url)
        
        return urlRequest
    }
}
