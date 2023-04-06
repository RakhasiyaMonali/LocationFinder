//
//  LocationPresenterTests.swift
//  LocationFinderTests
//
//  Created by Monali on 26/06/22.
//

import XCTest
@testable import LocationFinder

final class LocationPresenterTests: XCTestCase {
    private var sut: LocationListPresenter!
    private var viewController: LocationDisplayLogicSpy!

    // MARK: - Lifecycle
    
    override func setUp() {
      super.setUp()
      
      let locationsPresenter = LocationListPresenter()
      let locationsViewController = LocationDisplayLogicSpy()
      
      locationsPresenter.viewController = locationsViewController
      
      sut = locationsPresenter
      viewController = locationsViewController
    }
    
    override func tearDown() {
      sut = nil
      viewController = nil
      
      super.tearDown()
    }
    
    // MARK: - Public Methods
    
    func testPresentFetchedLocations() {
      
    let response = LocationList.FetchLocations.Response(locations: ModelsMockFactory.getMockedLocation())
      sut.presentFetchedLocations(response: response)
      
      XCTAssertTrue(viewController.isCalledDisplayFetchedLocations, "Not started viewController.displayFetchedLocations(:)")
    }
  }
