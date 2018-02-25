//
//  ProductService.swift
//  WaveExam
//
//  Created by Ksyunia on 24/02/2018.
//  Copyright © 2018 Ksyunia Efimova. All rights reserved.
//
// params, evrything for the request

/*
 active_only    (optional)  false to return products that were deleted in the past (default: true).
 embed_accounts (optional)	true to embed the accounts in the response (default: false).
 modified_after (optional)	Datetime in ISO-8601 format. If provided, only products modified stricly after
                            modified_after will be provided. ( modified_after=2013-05-11T21:23:58+00:00 )
 modified_before (optional)	Datetime in ISO-8601 format. If provided, only products modified stricly before 
                            modified_before will be provided. ( modified_before=2013-05-11T21:23:58+00:00 )
 */

import UIKit


class ProductService {
    
    let Request = RequestManager() 
    
    private func makeInput(active_only:Bool? = nil, embed_accounts:Bool? = nil, modified_after:Date? = nil, modified_before:Date? = nil){
        let stringFromDate = Date().iso8601    // "2017-03-22T13:22:13+00:00"
        print(stringFromDate)
       
        setData(active_only: active_only, embed_accounts: embed_accounts, modified_after: modified_after, modified_before: modified_before)
       
    }
    
    private func setData(active_only:Bool? = nil, embed_accounts:Bool? = nil, modified_after:Date? = nil, modified_before:Date? = nil){
        Request.makeParamArr(paramValue:active_only, paramKey:"active_only", paramType:.bool)
        Request.makeParamArr(paramValue:embed_accounts, paramKey:"embed_accounts", paramType:.bool)
        Request.makeParamArr(paramValue:modified_after, paramKey:"modified_after", paramType:.date)
        Request.makeParamArr(paramValue:modified_before, paramKey:"modified_before", paramType:.date)
    }
    
    private func getUrl(business_id: String)->String{
        return "\(business_id)/products/"
    }
    
    func getEndUnitProducts(business_id: String, data:[String:Any?]){
       // Request.makeAuthRequest()
        makeInput(active_only: data["active_only"] as? Bool, embed_accounts: data["embed_accounts"] as? Bool, modified_after: data["modified_after"] as? Date, modified_before: data["modified_before"] as? Date)
        let getProductsURLStr = getUrl(business_id: business_id)
        Request.makeRequest(rote: .business, method: getProductsURLStr, http: .get)
    }

}
