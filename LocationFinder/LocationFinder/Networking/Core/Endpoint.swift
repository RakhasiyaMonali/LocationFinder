//
//  Endpoint.swift
//  LocationFinder
//
//  Created by Monali on 23/06/22.
//


import Foundation

// MARK: - Endpoint
protocol Endpoint {
    var path: String { get set }
    var queryItems: [URLQueryItem]? { get set }
    
    var scheme: String? { get }
    var host: String? { get }
    var url: URL? { get }
}

extension Endpoint {
    var url: URL? {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        components.queryItems = queryItems
        
        return components.url
    }
}

// MARK: - Basic implementation
struct StandardEndpoint: Endpoint {
    var path: String
    var queryItems: [URLQueryItem]? = nil
    var scheme: String? = "https"
    var host: String? = "raw.githubusercontent.com"
    
    init(path: String) {
        self.path = path
    }
}

extension StandardEndpoint: ExpressibleByStringLiteral {
    init(stringLiteral value: StringLiteralType) {
        path = value
    }
}
