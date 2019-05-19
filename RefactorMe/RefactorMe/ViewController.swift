//
//  ViewController.swift
//  RefactorMe
//
//  Created by BKA on 17/05/19.
//  Copyright © 2019 BKA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let tf = UITextView(frame: CGRect(x: 0, y: self.view.frame.height * 0.2, width: self.view.frame.width, height: self.view.frame.height))
        self.view.addSubview(tf)

        var productDataConsolidator = ProductDataConsolidator()

        //prices in in nzd
        var products = productDataConsolidator.get()

        tf.text = "Prices (NZD):\r"
        for product in products{
            if product != nil{
                tf.text += "\(product.name): $\(product.price)\r"
            }
        }

        //prices in in usd
        products = productDataConsolidator.getInUSD()

        tf.text += "\rPrices (USD):\r"
        for product in products{
            if product != nil{
                tf.text += "\(product.name): $\(product.price)\r"
            }
        }

        //prices in in EUR
        products = productDataConsolidator.getInEUR()

        tf.text += "\rPrices (EUR):\r"
        for product in products{
            if product != nil{
                tf.text += "\(product.name): $\(product.price)\r"
            }
        }
    }


}

