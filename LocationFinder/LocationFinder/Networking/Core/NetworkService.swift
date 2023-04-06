//
//  NetworkService.swift
//  LocationFinder
//
//  Created by Monali on 23/06/22.
//

import Foundation

// MARK: - NetworkService
protocol NetworkService {
    var session: NetworkSession { get set }
    var urlRequest: URLRequestFactory { get set }
    
    func create<Resource: Encodable>(_ resource: Resource, completion: @escaping (Result<ResourceID, Error>) -> Void)
    func get<Resource: Decodable>(completion: @escaping (Result<[Resource], Error>) -> Void)
}

// MARK: - ID model
enum ResourceID {
    case integer(Int)
    case uuid(UUID)
}

// MARK: - Basic implementation
struct StandardNetworkService: NetworkService {
    
    var session: NetworkSession
    var urlRequest: URLRequestFactory
    
    init(session: NetworkSession = URLSession.shared,
         urlRequest: URLRequestFactory) {
        self.session = session
        self.urlRequest = urlRequest
    }
    
    init(resourcePath: String) {
        let endpoint = StandardEndpoint(path: resourcePath)
            self.init(urlRequest: StandardURLRequestFactory(endpoint: endpoint))
    }
}
