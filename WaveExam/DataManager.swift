//
//  DataManager.swift
//  WaveExam
//
//  Created by Ksyunia on 25/02/2018.
//  Copyright © 2018 Ksyunia Efimova. All rights reserved.
//

/*
 In this project, we're going to be creating a simple app that shows a Wave user the products that they can charge for on their invoices.

 */

import UIKit

class DataManager{

    var business_id = ""
    var productsArr:[Product] = [Product]()
    
    init(){
        self.business_id = "89746d57-c25f-4cec-9c63-34d7780b044b"
        getProducts()
    }
    
    func setListTitle()->String{
        return productListTitle
    }
    
    func readProducts(notification:NSNotification){
        if let info = notification.userInfo{
            if let data = info["data"] as? [[String:Any]]{
                let ProductMap = ProductMapping()
                ProductMap.deleteAllRealm()
                ProductMap.mapToRealm(data: data)
                if let result = ProductMap.getFromRealm(){
                    productsArr = ProductMap.mapFromRealm(result: result)
                }
            }
        }
    }
    
    func getProducts(){
        let Service = ProductService()
        let params:[String:Any?] = [
                "active_only": true,
                "embed_accounts": true,
                "modified_after": nil,
                "modified_before": nil
        ]
        Service.getEndUnitProducts(business_id: business_id, data:params)
    }
}
