//
//  PlayerServiceModel.swift
//  LocationFinder
//
//  Created by Monali on 23/06/22.
//

import Foundation

struct locationsResponseModel: Decodable {
    
    let locations : [location]

}

struct location: Decodable {
    
    let name : String?
    let lat : Double?
    let long : Double?
}
