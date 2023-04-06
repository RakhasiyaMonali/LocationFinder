//
//  LocationInteractorTests.swift
//  LocationFinderTests
//
//  Created by Monali on 26/06/22.
//

import XCTest
@testable import LocationFinder

final class LocationInteractorTests: XCTestCase {
    
    // MARK: - Private Properties
    
    private var sut: LocationListInteractor!
    private var presenter: LocationPresentationLogicSpy!
    private var worker: LocationServiceLogicSpy!
    
    
    // MARK: - Lifecycle
    
    override func setUp() {
        super.setUp()
        
        let locationsPresenter = LocationPresentationLogicSpy()
        let locationsWorker = LocationServiceLogicSpy()
        let locationsInteractor = LocationListInteractor(presenter: locationsPresenter)
        
        locationsInteractor.worker = locationsWorker
        locationsInteractor.presenter = locationsPresenter
        
        sut = locationsInteractor
        worker = locationsWorker
        presenter = locationsPresenter
    }
    
    override func tearDown() {
        
        sut = nil
        presenter = nil
        worker = nil
        super.tearDown()
        
    }
    
    // MARK: - Public Methods
    
    func testFetchLocationssPresenterToFormatFetchedLocations() {
        
        let request = LocationList.FetchLocations.Request()
        
        sut.fetchLocations(request: request)
        
        XCTAssertTrue(worker.isCalledFetchLocations, "Not started worker.fetchLocations(:)")
        XCTAssertTrue(presenter.isCalledPresentFetchedLocations, "Not started presenter.presentFetchedLocations(:)")
        
    }
    
}
