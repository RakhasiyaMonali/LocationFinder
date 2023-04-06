//
//  ModelsMockFactory.swift
//  LocationFinderTests
//
//  Created by Monali on 27/06/22.
//


import Foundation
@testable import LocationFinder

enum ModelsMockFactory {
    
    static func getMockedLocation() -> [location] {
        
        var locations: [location] = []
        let locationModel = location(name: "Amsterdam", lat: 52.3547498, long: 4.8339215)
        locations.append(locationModel)
        return locations
    }
     
    static func getMockedLocationsResponseModel() -> locationsResponseModel{
        return locationsResponseModel(locations: ModelsMockFactory.getMockedLocation())
    }
}
