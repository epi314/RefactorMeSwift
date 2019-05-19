//
//  ProductsListRouter.swift
//  RefactorMe
//
//  Created by Pierre Enriquez on 19/5/19.
//  Copyright © 2019 BKA. All rights reserved.
//

import UIKit

class ProductsListRouter {
}

extension ProductsListRouter: ProductsListRoutable {
  static func configure(view: ProductsListPresenting) {
    // VIEW <-> PRESENTER
    let presenter: ProductsListPresentable & ProductsListRouting & ProductsListInteracting = ProductsListPresenter()
    presenter.view = view
    view.presenter = presenter
    
    // PRESENTER <-> INTERACTOR
    let interactor: ProductsListInteractable = ProductsListInteractor()
    presenter.interactor = interactor
    interactor.presenter = presenter
    
    // PRESENTER -> ROUTER
    let router: ProductsListRoutable = ProductsListRouter()
    presenter.router = router
  }
}
