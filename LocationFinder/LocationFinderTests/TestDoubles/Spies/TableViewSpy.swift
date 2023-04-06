//
//  TableViewSpy.swift
//  LocationFinderTests
//
//  Created by Monali on 27/06/22.
//

import UIKit

final class TableViewSpy: UITableView {
  
  // MARK: - Public Properties
  
  private(set) var isCalledReloadData = false
  
  // MARK: - Public Methods
  
  override func reloadData() {
    super.reloadData()
    isCalledReloadData = true
  }
}
