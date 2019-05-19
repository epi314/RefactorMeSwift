//
//  ProductsListProtocols.swift
//  RefactorMe
//
//  Created by Pierre Enriquez on 19/5/19.
//  Copyright © 2019 BKA. All rights reserved.
//

protocol ProductsListPresentable: class {
  var view: ProductsListPresenting? { get set }

  // MARK: VIEW -> PRESENTER
  func viewDidLoad()
}

protocol ProductsListPresenting: class {
  var presenter: ProductsListPresentable? { get set }
  
  // MARK: PRESENTER -> VIEW
  func show(listings: [ProductsList.ViewModel.Listing])
}

protocol ProductsListInteractable: class {
  var presenter: ProductsListInteracting? { get set }
  
  // MARK: PRESENTER -> INTERACTOR
  func fetchProducts()
}

protocol ProductsListInteracting: class {
  var interactor: ProductsListInteractable? { get set }
  
  // MARK: INTERACTOR -> PRESENTER
  func didGet(products: [Product])
}

protocol ProductsListRoutable: class {
  static func configure(view: ProductsListPresenting)
  
  // MARK: PRESENTER -> ROUTER
}

protocol ProductsListRouting: class {
  var router: ProductsListRoutable? { get set }
}
