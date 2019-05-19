//
//  ProductDataConsolidator.swift
//  RefactorMe
//
//  Created by BKA on 17/05/19.
//  Copyright © 2019 BKA. All rights reserved.
//

import Foundation
class ProductDataConsolidator{
    func get()->(Array<Product>){
        
        var cameraData = getJsonData(path: "Cameras");
        var phoneData = getJsonData(path: "Phones");
        var sunglassesData = getJsonData(path: "Sunglasses");
        
        var ps = Array<Product>()
        
        for camera in (cameraData as! NSArray){
            var product = Product()
            product.type = "Camera"
            product.id = (camera as! Dictionary<String, Any>)["id"] as! Int
            product.name = (camera as! Dictionary<String, Any>)["name"] as! String
            product.price = (camera as! Dictionary<String, Any>)["price"] as! Double
            ps.append(product)
        }
        
        for phone in (phoneData as! NSArray){
            var product = Product()
            product.type = "Phone"
            product.id = (phone as! Dictionary<String, Any>)["id"] as! Int
            product.name = (phone as! Dictionary<String, Any>)["name"] as! String
            product.price = (phone as! Dictionary<String, Any>)["price"] as! Double
            ps.append(product)
        }
        
        for sunglasses in (sunglassesData as! NSArray){
            var product = Product()
            product.type = "Sunglasses"
            product.id = (sunglasses as! Dictionary<String, Any>)["id"] as! Int
            product.name = (sunglasses as! Dictionary<String, Any>)["name"] as! String
            product.price = (sunglasses as! Dictionary<String, Any>)["price"] as! Double
            ps.append(product)
        }
        
        return ps
    }
    
    func getInUSD()->(Array<Product>){
        
        var cameraData = getJsonData(path: "Cameras");
        var phoneData = getJsonData(path: "Phones");
        var sunglassesData = getJsonData(path: "Sunglasses");
        
        var ps = Array<Product>()
        
        for camera in (cameraData as! NSArray){
            var product = Product()
            product.type = "Camera"
            product.id = (camera as! Dictionary<String, Any>)["id"] as! Int
            product.name = (camera as! Dictionary<String, Any>)["name"] as! String
            product.price = (camera as! Dictionary<String, Any>)["price"] as! Double * 0.65
            ps.append(product)
        }
        
        for phone in (phoneData as! NSArray){
            var product = Product()
            product.type = "Phone"
            product.id = (phone as! Dictionary<String, Any>)["id"] as! Int
            product.name = (phone as! Dictionary<String, Any>)["name"] as! String
            product.price = (phone as! Dictionary<String, Any>)["price"] as! Double * 0.65
            ps.append(product)
        }
        
        for sunglasses in (sunglassesData as! NSArray){
            var product = Product()
            product.type = "Sunglasses"
            product.id = (sunglasses as! Dictionary<String, Any>)["id"] as! Int
            product.name = (sunglasses as! Dictionary<String, Any>)["name"] as! String
            product.price = (sunglasses as! Dictionary<String, Any>)["price"] as! Double * 0.65
            ps.append(product)
        }
        
        return ps
    }
    
    func getInEUR()->(Array<Product>){
        
        var cameraData = getJsonData(path: "Cameras");
        var phoneData = getJsonData(path: "Phones");
        var sunglassesData = getJsonData(path: "Sunglasses");
        
        var ps = Array<Product>()
        
        for camera in (cameraData as! NSArray){
            var product = Product()
            product.type = "Camera"
            product.id = (camera as! Dictionary<String, Any>)["id"] as! Int
            product.name = (camera as! Dictionary<String, Any>)["name"] as! String
            product.price = (camera as! Dictionary<String, Any>)["price"] as! Double * 0.59
            ps.append(product)
        }
        
        for phone in (phoneData as! NSArray){
            var product = Product()
            product.type = "Phone"
            product.id = (phone as! Dictionary<String, Any>)["id"] as! Int
            product.name = (phone as! Dictionary<String, Any>)["name"] as! String
            product.price = (phone as! Dictionary<String, Any>)["price"] as! Double * 0.59
            ps.append(product)
        }
        
        for sunglasses in (sunglassesData as! NSArray){
            var product = Product()
            product.type = "Sunglasses"
            product.id = (sunglasses as! Dictionary<String, Any>)["id"] as! Int
            product.name = (sunglasses as! Dictionary<String, Any>)["name"] as! String
            product.price = (sunglasses as! Dictionary<String, Any>)["price"] as! Double * 0.59
            ps.append(product)
        }
        
        return ps
    }
    
    func getJsonData(path:String)->(Any?){
        
        do{
            if let url = Bundle.main.url(forResource: path, withExtension: "json"){
                let data = try Data(contentsOf: url)
                
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                return jsonResult
            }
        }
        catch{}
        return nil
    }
}
