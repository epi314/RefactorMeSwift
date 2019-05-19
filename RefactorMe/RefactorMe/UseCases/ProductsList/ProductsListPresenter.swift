//
//  ProductsListPresenter.swift
//  RefactorMe
//
//  Created by Pierre Enriquez on 19/5/19.
//  Copyright © 2019 BKA. All rights reserved.
//

import Foundation

class ProductsListPresenter {
  weak var view: ProductsListPresenting?
  var interactor: ProductsListInteractable?
  var router: ProductsListRoutable?
}

// MARK: Make Presentable
extension ProductsListPresenter: ProductsListPresentable {
  func viewDidLoad() {
    interactor?.fetchProducts()
  }
}

// MARK: Make Interacting
extension ProductsListPresenter: ProductsListInteracting {
  func didGet(products: [Product]) {
    
    var shownListings : [ProductsList.ViewModel.Listing] = []
    
    // Price (NZD)
    var shownProducts = products.map { (product) -> ProductsList.ViewModel.Product in
      let productViewModel = ProductsList.ViewModel.Product(id: product.id, type: product.type, name: product.name, price: product.price)
      return productViewModel
    }
    var shownListing = ProductsList.ViewModel.Listing(section: "Prices (NZD)", rows: shownProducts)
    shownListings.append(shownListing)
    
    // Price (USD)
    shownProducts = products.map { (product) -> ProductsList.ViewModel.Product in
      let productViewModel = ProductsList.ViewModel.Product(id: product.id, type: product.type, name: product.name, price: product.price * 0.65)
      return productViewModel
    }
    shownListing = ProductsList.ViewModel.Listing(section: "Prices (USD)", rows: shownProducts)
    shownListings.append(shownListing)
    
    // Price (EUR)
    shownProducts = products.map { (product) -> ProductsList.ViewModel.Product in
      let productViewModel = ProductsList.ViewModel.Product(id: product.id, type: product.type, name: product.name, price: product.price * 0.59)
      return productViewModel
    }
    shownListing = ProductsList.ViewModel.Listing(section: "Prices (EUR)", rows: shownProducts)
    shownListings.append(shownListing)
    
    view?.show(listings: shownListings)
  }
}

// MARK: Make Routing
extension ProductsListPresenter: ProductsListRouting {
}
