//
//  ProductsFileStore.swift
//  RefactorMe
//
//  Created by Pierre Enriquez on 19/5/19.
//  Copyright © 2019 BKA. All rights reserved.
//

import Foundation
import os.log

fileprivate class _Product: Decodable {
  let id: Int
  let name: String
  let price: Double
}

fileprivate class Camera: _Product {
  let megaPixels: Int = 0
  let video: String = ""
}

fileprivate class Phone: _Product {
  let screenSize: Int = 0
}

fileprivate class Sunglasses: _Product {
  let polarised: Bool = false
}

class ProductsFileStore {
  func getJsonData(path: String) -> Data? {
    do {
      if let url = Bundle.main.url(forResource: path, withExtension: "json"){
        let data = try Data(contentsOf: url)
        return data
      }
    } catch {
    }
    
    return nil
  }
}

// Implementation of ProductsStore protocol
extension ProductsFileStore: ProductsStore {
  func fetchProducts(completion: @escaping (Result<[Product], Error>) -> ()) {
    var products: [Product] = []

    do {
      let cameras: [Product] = try {
        var products: [Product] = []
        guard let jsonData = getJsonData(path: "Cameras") else { return products }
        let cameras = try JSONDecoder().decode([Camera].self, from: jsonData)
        for camera in cameras {
          let product = Product(id: camera.id, name: camera.name, price: camera.price, type: "Camera")
          products.append(product)
        }
        return products
      }()
      products.append(contentsOf: cameras)
      
      let phones: [Product] = try {
        var products: [Product] = []
        guard let jsonData = getJsonData(path: "Phones") else { return products }
        let phones = try JSONDecoder().decode([Phone].self, from: jsonData)
        for phone in phones {
          let product = Product(id: phone.id, name: phone.name, price: phone.price, type: "Phone")
          products.append(product)
        }
        return products
      }()
      products.append(contentsOf: phones)
      
      let sunglasses: [Product] = try {
        var products: [Product] = []
        guard let jsonData = getJsonData(path: "Sunglasses") else { return products }
        let sunglasses = try JSONDecoder().decode([Camera].self, from: jsonData)
        for sunglass in sunglasses {
          let product = Product(id: sunglass.id, name: sunglass.name, price: sunglass.price, type: "Sunglass")
          products.append(product)
        }
        return products
      }()
      products.append(contentsOf: sunglasses)
      
      completion(.success(products))
      
    } catch let error {
      completion(.failure(error))
    }
  }
}
