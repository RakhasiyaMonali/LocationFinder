//
//  LocationTableViewCell.swift
//  LocationFinder
//
//  Created by Monali on 23/06/22.
//

import UIKit
import MapKit

class LocationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblLocationName: UILabel!
    @IBOutlet weak var lblLocationLat: UILabel!
    @IBOutlet weak var lblLocationLong: UILabel!    

    var locationDetail : LocationList.FetchLocations.ViewModel.DisplayedLocation! {
        didSet {
            self.lblLocationLat.text = "Latitude: \(locationDetail.lat)"
            self.lblLocationLong.text = "Longitude: \(locationDetail.long)"
            
            if locationDetail.name.isEmpty {
                
                let location = CLLocation(latitude: locationDetail.lat, longitude: locationDetail.long)
                location.fetchCityAndCountry { city, error in
                    self.lblLocationName.text = city
                }
            }
            else {
                self.lblLocationName.text = locationDetail.name
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

