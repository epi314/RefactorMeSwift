//
//  ProductsStore.swift
//  RefactorMe
//
//  Created by Pierre Enriquez on 19/5/19.
//  Copyright © 2019 BKA. All rights reserved.
//

import Foundation

protocol ProductsStore: class {
  func fetchProducts(completion: @escaping (Result<[Product], Error>) -> ())
}
