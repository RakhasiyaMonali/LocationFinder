//
//  LocationPresentationLogicSpy.swift
//  LocationFinderTests
//
//  Created by Monali on 26/06/22.
//

import Foundation
@testable import LocationFinder

final class LocationPresentationLogicSpy: LocationListPresentationLogic {
    
    // MARK: - Public Properties
    
    private(set) var isCalledPresentFetchedLocations = false

    
    func presentFetchedLocations(response: LocationList.FetchLocations.Response) {
        isCalledPresentFetchedLocations = true
    }
    
    func presentError(response: LocationList.ErrorResponse) {
        
    }
    
    func presentValidationError(message: String) {
        
    }
    
}
