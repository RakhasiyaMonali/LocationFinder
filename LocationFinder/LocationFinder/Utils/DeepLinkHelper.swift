//
//  DeepLink.swift
//  LocationFinder
//
//  Created by Monali on 24/06/22.
//

import Foundation
import UIKit

struct DeepLinkHelper {
    
    //redirect app to wikimedia app
    static func deepLinkToWikiApp(city: String){
        if let url = URL(string: "wikipedia://places?WMFArticleURL=https://en.wikipedia.org/wiki/\(city)"),
           
            UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
        else {
            UIApplication.shared.open(URL(string: "https://apps.apple.com/app/wikipedia/id324715238?mt=8")!)
        }
    }
}
