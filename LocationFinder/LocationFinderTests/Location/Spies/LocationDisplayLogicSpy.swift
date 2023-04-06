//
//  LocationDisplayLogicSpy.swift
//  LocationFinderTests
//
//  Created by Monali on 27/06/22.
//

import Foundation
@testable import LocationFinder

final class LocationDisplayLogicSpy: LocationListDisplayLogic {
    
    func displayError(viewModel: LocationList.ErrorViewModel) {
        
    }
  
  // MARK: - Public Properties
  
  private(set) var isCalledDisplayFetchedLocations = false
    private(set) var Locations: [LocationList.FetchLocations.ViewModel.DisplayedLocation] = []
  
  // MARK: - Public Methods
      
    func displayFetchedLocations(viewModel: LocationList.FetchLocations.ViewModel) {
        isCalledDisplayFetchedLocations = true
        Locations = viewModel.displayedLocations
    }
}
