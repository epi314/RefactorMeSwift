//
//  ProductsListViewModel.swift
//  RefactorMe
//
//  Created by Pierre Enriquez on 19/5/19.
//  Copyright © 2019 BKA. All rights reserved.
//

import Foundation

enum ProductsList {
  struct ViewModel {
    struct Product {
      var id: Int
      var type: String;
      var name: String;
      var price: Double;
    }
    
    struct Listing {
      var section: String
      var rows: [Product]
    }
    
    var shownListings: [Listing]
  }
}
