//
//  LocationListViewController.swift
//  LocationFinder
//
//  Created by Monali on 22/06/22.
//

import UIKit

protocol LocationListDisplayLogic: AnyObject
{
    func displayFetchedLocations(viewModel: LocationList.FetchLocations.ViewModel)
    func displayError(viewModel: LocationList.ErrorViewModel)

}

class LocationListViewController: UIViewController {
    
    var interactor: LocationListBusinessLogic?
    
    @IBOutlet weak var locationListTableView: UITableView!
    @IBOutlet weak var btnFindLocation: UIButton!
    
    @IBOutlet weak var txtLatitude: UITextField!
    @IBOutlet weak var txtLongitude: UITextField!
    
    private var displayedLocations: [LocationList.FetchLocations.ViewModel.DisplayedLocation] = []
    lazy var loadingView = LoadingView.initToView(view)
    
    lazy var emptyView: EmptyView = {
        let emptyView = EmptyView.initToView(view, infoText: "There aren't any players for your user.")
        emptyView.delegate = self
        return emptyView
    }()

    // MARK: Object lifecycle

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    // MARK: - Setup Clean Code Design Pattern 

    private func setup() {
        let viewController = self
        let interactor = LocationListInteractor()
        let presenter = LocationListPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }

    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTitle("Locations")
        locationListTableView.register(LocationTableViewCell.self, forCellReuseIdentifier: "locationCell")
        fetchLocations()
    }
    
    private func reloadData() {
        locationListTableView.reloadData()
    }

    private func configureTitle(_ title: String) {
        self.title = title
    }
    // MARK: - request data from LocationListInteractor

    private func fetchLocations() {
        showLoadingView()
        let request = LocationList.FetchLocations.Request()
        interactor?.fetchLocations(request: request)
    }
    
    //MARK: - receive events from UI
    
    @IBAction func btnFindLocationTap(_ sender: Any) {
        interactor?.validate(latitude: txtLatitude.text?.trimmed ?? "", longitude: txtLongitude.text?.trimmed ?? "")
    }
    
}

extension LocationListViewController: LocationListDisplayLogic {
    
    // MARK: - display view model from LocationListPresenter

    func displayFetchedLocations(viewModel: LocationList.FetchLocations.ViewModel) {
        displayedLocations = viewModel.displayedLocations
        hideLoadingView()
        showEmptyViewIfRequired()
        reloadData()
    }
    
    private func showEmptyViewIfRequired() {
        if locationsCollectionIsEmpty {
            showEmptyView()
        } else {
            hideEmptyView()
        }
    }
    
    private var locationsCollectionIsEmpty: Bool {
        displayedLocations.isEmpty
    }

    func displayError(viewModel: LocationList.ErrorViewModel) {
        hideLoadingView()
        handleError(title: viewModel.errorTitle, message: viewModel.errorMessage)
    }
}

// MARK: - Error Handler
extension LocationListViewController: ErrorHandler {}

// MARK: - Loadable
extension LocationListViewController: Loadable {}

// MARK: - EmptyViewable
extension LocationListViewController: EmptyViewable {
    func showEmptyView() {
        locationListTableView.isHidden = true
        emptyView.isHidden = false
    }
    
    func hideEmptyView() {
        locationListTableView.isHidden = false
        emptyView.isHidden = true
    }
    
    func retryAction() {
        hideEmptyView()
        fetchLocations()
    }
}

// MARK: - UITableViewDelegate | UITableViewDataSource
extension LocationListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        displayedLocations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = Bundle.main.loadNibNamed("LocationTableViewCell", owner: self, options: nil)?.first as! LocationTableViewCell

        cell.locationDetail = self.displayedLocations[indexPath.row]

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        interactor?.openWikipediaApp(location: self.displayedLocations[indexPath.row])

    }
}
