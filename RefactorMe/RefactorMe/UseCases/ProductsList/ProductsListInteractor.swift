//
//  ProductsListInteractor.swift
//  RefactorMe
//
//  Created by Pierre Enriquez on 19/5/19.
//  Copyright © 2019 BKA. All rights reserved.
//

import Foundation

class ProductsListInteractor {
  weak var presenter: ProductsListInteracting?
  
  let store: ProductsStore = ProductsFileStore()
}

// MARK: Make Interactable
extension ProductsListInteractor: ProductsListInteractable {
  func fetchProducts() {
    store.fetchProducts { (res) in
      switch res {
        case .success(let products):
          self.presenter?.didGet(products: products)
        case .failure(let err):
          print("Failed to fetch products:", err)
      }
    }
  }
}
