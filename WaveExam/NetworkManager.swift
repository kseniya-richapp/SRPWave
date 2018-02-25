//
//  NetworkManager.swift
//  WaveExam
//
//  Created by Ksyunia on 24/02/2018.
//  Copyright © 2018 Ksyunia Efimova. All rights reserved.
//
//NSURSession, Alamofire

import UIKit

class NetworkManager{
    var baseUrlStr = ""
    let fullURL:URL?
    var fullURLStr = ""
    var request:URLRequest?
    let APi = APIClient()
    
    init(rote: APIClient.Rotes, method:String, http: APIClient.HTTPVerbs) {
        baseUrlStr = APi.getBaseUrl(rote: rote)
        APi.prepareAuth(http:http)
        fullURLStr = baseUrlStr+method
        fullURL = URL(string:fullURLStr)
    }
    
    func prepareURLRequest(params:String? = nil, components:URLComponents? = nil){
        guard let url = fullURL else{return}
        if(APIClient.http == "GET"){
            guard let components = components else {return}
            guard let componentsUrl = components.url else {return}
            request = URLRequest(url: componentsUrl)
        }else{
            request = URLRequest(url: url)
        }
        guard var urlRequest = self.request else{ return}
        urlRequest.httpMethod = APIClient.http
        if let paramsStr = params{
            if(APIClient.http == "GET"){
                urlRequest.httpBody = paramsStr.data(using: .utf8)
            }
        }
        urlRequest.addValue(APIClient.authValue, forHTTPHeaderField: APIClient.authTitle)
        request = urlRequest
     }
    
}
