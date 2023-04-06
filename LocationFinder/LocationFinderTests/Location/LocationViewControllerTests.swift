//
//  LocationViewControllerTests.swift
//  LocationFinderTests
//
//  Created by Monali on 27/06/22.
//

import XCTest
@testable import LocationFinder

final class LocationViewControllerTests: XCTestCase {
    
    // MARK: - Private Properties
    
    private var sut: LocationListViewController!
    private var interactor: LocationBusinessLogicSpy!
    private var window: UIWindow!
    
    // MARK: - Lifecycle
    
    override func setUp() {
        super.setUp()
        
        let mainWindow = UIWindow()
        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        
        let homeViewController = storyboard.instantiateViewController(
            identifier: "LocationListViewController") as? LocationListViewController
        let homeInteractor = LocationBusinessLogicSpy()
        
        homeViewController?.interactor = homeInteractor
        
        sut = homeViewController
        interactor = homeInteractor
        window = mainWindow
        
        window.addSubview(sut.view)
        RunLoop.current.run(until: Date())
    }
    
    override func tearDown() {
        sut = nil
        interactor = nil
        window = nil
        
        super.tearDown()
    }
    
    // MARK: - Public Methods
    
    func testViewDidLoad() {
        sut.viewWillAppear(true)
        
        XCTAssert(interactor.isCalledFetchLocations, "Not started interactor.fetchLocations(:)")
    }
    
    func testDisplayFetchedLocations() {
        let tableViewSpy = TableViewSpy()
        let locations = [LocationList.FetchLocations.ViewModel.DisplayedLocation(lat: 52.3547498, name: "Amsterdam", long: 4.8339215)]
        
        let viewModel = LocationList.FetchLocations.ViewModel(displayedLocations: locations)
        sut.locationListTableView = tableViewSpy
        sut.locationListTableView.dataSource = sut
        sut.displayFetchedLocations(viewModel: viewModel)
        
        XCTAssertTrue(tableViewSpy.isCalledReloadData, "Not started tableView.reloadData")
    }
}
