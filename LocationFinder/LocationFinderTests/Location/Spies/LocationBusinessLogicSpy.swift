//
//  LocationListDisplayLogicSpy.swift
//  LocationFinderTests
//
//  Created by Monali on 27/06/22.
//

import Foundation
@testable import LocationFinder

final class LocationBusinessLogicSpy: LocationListBusinessLogic {
     
  // MARK: - Public Properties
  
  private(set) var isCalledFetchLocations = false
  
  // MARK: - Public Methods
      
    func fetchLocations(request: LocationList.FetchLocations.Request) {
        isCalledFetchLocations = true

    }
    
    func openWikipediaApp(location: LocationList.FetchLocations.ViewModel.DisplayedLocation) {
        
    }
    
    func validate(latitude: String, longitude: String) {
        
    }
}
