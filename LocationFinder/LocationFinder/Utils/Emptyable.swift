//
//  Emptyable.swift
//  LocationFinder
//
//  Created by Monali on 23/06/22.
//


import UIKit

protocol Emptyable {
    var emptyView: EmptyView { get }
    
    func showEmptyView()
    func hideEmptyView()
}

typealias EmptyViewable = Emptyable & EmptyViewDelegate
