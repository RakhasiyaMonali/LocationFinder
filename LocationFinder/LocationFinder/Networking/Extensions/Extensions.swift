//
//  View+Extensions.swift
//  LocationFinder
//
//  Created by Monali on 23/06/22.
//


import UIKit
import MapKit

extension UIView {
    static func instanceFromNib<T>() -> T? {
        return UINib(nibName: String(describing: T.self), bundle: nil).instantiate(withOwner: nil, options: nil).first as? T
    }
}

extension CLLocation {
    
    //get city name from coordinates
    func fetchCityAndCountry(completion: @escaping (_ city: String?, _ error: Error?) -> ()) {
        CLGeocoder().reverseGeocodeLocation(self) { completion($0?.first?.locality, $1) }
    }
    
    
    //get city name from latitide and longitude
    private func getCityName(lat: Double, lng: Double, completion: @escaping (String) -> Void) {
        let location = CLLocation(latitude: lat, longitude: lng)
        location.fetchCityAndCountry { city, error in
            guard let city = city, error == nil else { return }
            print(city)
            completion(city)
        }
    }
    
}


extension String {
    var trimmed: String {
        return trimmingCharacters(in: .whitespacesAndNewlines)
    }
}


