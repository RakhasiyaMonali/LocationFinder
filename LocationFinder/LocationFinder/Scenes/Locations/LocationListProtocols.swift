//
//  LocationListProtocols.swift
//  LocationFinder
//
//  Created by Monali on 23/06/22.
//

import Foundation

// MARK: - View
//typealias LocationListViewProtocol = PlayerListViewable & Loadable & Emptyable & PlayerListViewDisplayable & PlayerListViewErrorHandler & PlayerListViewReloadable & PlayerListViewUpdatable & PlayerListViewRoutable
////
//protocol PlayerListViewable: AnyObject {
//    var interactor: PlayerListInteractorProtocol { get set }
//    var router: PlayerListRouterProtocol { get set }
//}
//
//// MARK: - Interactor
//
//typealias PlayerListInteractorProtocol = PlayerListInteractable & PlayerListInteractorServiceRequester & PlayerListInteractorActionable & PlayerListInteractorTableDelegate


// MARK: - Interactor
typealias PlayerListInteractorProtocol = LocationListDisplayLogic & LocationtValidationLogic

protocol PlayerListViewable: AnyObject {
    var interactor: PlayerListInteractorProtocol { get set }
}
