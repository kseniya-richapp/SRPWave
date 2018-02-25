//
//  ProductMapping.swift
//  WaveExam
//
//  Created by Ksyunia on 25/02/2018.
//  Copyright © 2018 Ksyunia Efimova. All rights reserved.
//

import UIKit
import RealmSwift

class ProductMapping{
    
    func mapToRealm(data:[[String:Any]]){
        for product in data{
            let productRealm = mapProduct(product:product)
            saveToRealm(product:productRealm)
        }
    }
    
    func deleteAllRealm(){
        RealmObj.shared.deleteAll()
    }
    
    func saveToRealm(product:ProductRealm){
        RealmObj.shared.write(obj: product)
    }
    
    func getFromRealm()->Results<ProductRealm>?{
        let products = RealmObj.shared.read()
        return products
    }
    
    func mapFromRealm(result:Results<ProductRealm>)->[Product]{
        var products = [Product]()
        for productRealm in result{
            let product = mapProductRealm(productRealm:productRealm)
            products.append(product)
        }
        return products
    }
    
    func mapProduct(product:[String:Any])->ProductRealm{
        let productRealm = ProductRealm()
        if let id = product["id"] as? Int{
            productRealm.id = id
        }
        if let name = product["name"] as? String{
            productRealm.name = name
        }
        if let price = product["price"] as? Float{
            productRealm.price = price
        }
        if let incomeAccount = product["income_account"] as? [String:Any]{
            if let currency = incomeAccount["currency"]  as? [String:Any]{
                if let dollar = currency["symbol"] as? String{
                    productRealm.currency = dollar
                }
            }
        }
        return productRealm
    }
    
    func mapProductRealm(productRealm:ProductRealm)->Product{
        let product = Product()
        product.id = productRealm.id
        product.name = productRealm.name
        product.price = productRealm.price
        product.currency = productRealm.currency
        return product
    }

}
