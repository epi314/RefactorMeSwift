//
//  ProductsListViewController.swift
//  RefactorMe
//
//  Created by Pierre Enriquez on 19/5/19.
//  Copyright © 2019 BKA. All rights reserved.
//

import UIKit

class ProductsListViewController: UITableViewController {
  var presenter: ProductsListPresentable?
  
  private var listings: [ProductsList.ViewModel.Listing] = []
  
  private let listingCellId = "listingCellId"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Setup connections when view is loaded
    ProductsListRouter.configure(view: self)
    
    // Setup view
    setupViews()
    
    presenter?.viewDidLoad()
  }
}

// MARK: Private methods
extension ProductsListViewController {
  private func setupViews() {
    navigationItem.title = "Products"
    navigationController?.navigationBar.prefersLargeTitles = true
    
    tableView.backgroundColor = .white
    
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: listingCellId)
  }
}

// MARK: Make Presenting
extension ProductsListViewController: ProductsListPresenting {
  func show(listings: [ProductsList.ViewModel.Listing]) {
    self.listings = listings
    tableView.reloadData()
  }
}

// MARK: UITableViewDataSource
extension ProductsListViewController {
  override func numberOfSections(in tableView: UITableView) -> Int {
    return self.listings.count
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.listings[section].rows.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: listingCellId, for: indexPath)
    
    let name = self.listings[indexPath.section].rows[indexPath.row].name
    let price = self.listings[indexPath.section].rows[indexPath.row].price
    let type = self.listings[indexPath.section].rows[indexPath.row].type
    
    cell.textLabel?.text = "\(name) (\(type)): $\(String(format: "%.2f", price))"
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return self.listings[section].section
  }
}



