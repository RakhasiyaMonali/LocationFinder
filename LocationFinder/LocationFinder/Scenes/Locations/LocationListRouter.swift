//
//  LocationListRouter.swift
//  LocationFinder
//
//  Created by Monali on 22/06/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

//@objc protocol LocationListRoutingLogic {
//    //func routeToSomewhere(segue: UIStoryboardSegue?)
//}
//
//protocol LocationListDataPassing {
//    var dataStore: LocationListDataStore? { get }
//}
//
//class LocationListRouter: NSObject, LocationListRoutingLogic, LocationListDataPassing {
//    weak var viewController: LocationListViewController?
//    var dataStore: LocationListDataStore?
//
//// MARK: Routing (navigating to other screens)

//func routeToSomewhere(segue: UIStoryboardSegue?) {
//    if let segue = segue {
//        let destinationVC = segue.destination as! SomewhereViewController
//        var destinationDS = destinationVC.router!.dataStore!
//        passDataToSomewhere(source: dataStore!, destination: &destinationDS)
//    } else {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
//        var destinationDS = destinationVC.router!.dataStore!
//        passDataToSomewhere(source: dataStore!, destination: &destinationDS)
//        navigateToSomewhere(source: viewController!, destination: destinationVC)
//    }
//}

// MARK: Navigation to other screen

//func navigateToSomewhere(source: LocationListViewController, destination: SomewhereViewController) {
//    source.show(destination, sender: nil)
//}

// MARK: Passing data to other screen

//    func passDataToSomewhere(source: LocationListDataStore, destination: inout SomewhereDataStore) {
//        destination.name = source.name
//    }
//}
