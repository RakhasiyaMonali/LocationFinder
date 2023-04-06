//
//  LocationServiceLogicSpy.swift
//  LocationFinderTests
//
//  Created by Monali on 26/06/22.
//

import Foundation
@testable import LocationFinder

final class LocationServiceLogicSpy: LocationsWorkingLogic {
  // MARK: - Public Properties
  
  private(set) var isCalledFetchLocations = false
  
  // MARK: - Public Methods
  
    
    func fetchLocations(request: LocationList.FetchLocations.Request, _ completion: @escaping (Result<locationsResponseModel, Error>?) -> Void) {
        isCalledFetchLocations = true
        let locationsResponseModel = ModelsMockFactory.getMockedLocationsResponseModel()
        completion(.success(locationsResponseModel))

    }
}
