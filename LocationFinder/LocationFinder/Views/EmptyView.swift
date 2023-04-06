//
//  EmptyView.swift
//  LocationFinder
//
//  Created by Monali on 23/06/22.
//


import UIKit

protocol EmptyViewDelegate: AnyObject {
    func retryAction()
}

class EmptyView: UIView {
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var retryButton: UIButton!
    
    weak var delegate: EmptyViewDelegate?
    
    static func initToView(_ view: UIView, infoText: String) -> EmptyView {
        guard let emptyView: EmptyView = UIView.instanceFromNib() else {
            fatalError("Unable to allocate Empty View")
        }
        
        emptyView.infoLabel.text = infoText
        emptyView.isHidden = true
        emptyView.center = view.center
        view.addSubview(emptyView)
        
        return emptyView
    }
    
    @IBAction func onRetryAction(_ sender: Any) {
        delegate?.retryAction()
    }
    
    func show() {
        isHidden = false
    }
    
    func hide() {
        isHidden = true
    }
    
}
