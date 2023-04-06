//
//  Loadable.swift
//  LocationFinder
//
//  Created by Monali on 23/06/22.
//


import UIKit

protocol Loadable {
    var loadingView: LoadingView { get }
    
    func showLoadingView()
    func hideLoadingView()
}

extension Loadable where Self: UIViewController {    
    func showLoadingView() {
        view.isUserInteractionEnabled = false
        loadingView.show()
    }
    
    func hideLoadingView() {
        view.isUserInteractionEnabled = true
        view.endEditing(true)
        loadingView.hide()
    }
}

extension Loadable where Self: UIView {
    func showLoadingView() {
        isUserInteractionEnabled = false
        loadingView.show()
    }
    
    func hideLoadingView() {
        isUserInteractionEnabled = true
        endEditing(true)
        loadingView.hide()
    }
}
