//
//  GetNetworkService.swift
//  LocationFinder
//
//  Created by Monali on 23/06/22.
//

import Foundation

extension NetworkService {
    func get<Resource: Decodable>(completion: @escaping (Result<Resource, Error>) -> Void) {
        var request = urlRequest.makeURLRequest()
        request.httpMethod = "GET"
        
        session.loadData(from: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data, data.isEmpty == false else {
                completion(.failure(ServiceError.unexpectedResponse))
                return
            }
            
            do {
                let resources = try JSONDecoder().decode(Resource.self, from: data)
                completion(.success(resources))
            } catch {
                completion(.failure(error))
            }
        }
    }
}
