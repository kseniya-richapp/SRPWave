//
//  RequestManager.swift
//  WaveExam
//
//  Created by Ksyunia on 24/02/2018.
//  Copyright © 2018 Ksyunia Efimova. All rights reserved.
//
/*
 let postString = "id=1234&name=wei"
 request.httpBody = postString.data(using: .utf8)
 */

import UIKit

protocol RequestDelegate: class{
    func parseData(data:[[String:Any]]?)
}

class RequestManager{
  
    //weak var delegate:RequestDelegate?
    var params:String? = nil
    var paramsArr:[String] = [String]()
    var components:URLComponents?
    var getParamsArr:[String:String] = [String:String]()
    
    enum ParamTypes{
        case str
        case int
        case bool
        case date
    }
    
//    init(withDelegate delegate: RequestDelegate?) {
//        self.delegate = delegate
//    }

    
    func makeParamArr(paramValue:Any?, paramKey:String, paramType:ParamTypes = .str){
        if let param = paramValue{
            var paramStr = ""
            if(paramType != .str){
                switch(paramType){
                case .str:
                    if let param = param as? String{
                        paramStr = param
                    }
                case .int, .bool:
                    paramStr = "\(param)"
                case .date:
                    if let param = param as? Date{
                        paramStr = "\(param.iso8601)"
                    }
                }
            }
            getParamsArr[paramKey] = paramStr
            let paramChain = String(format: "%@=%@", paramKey, paramStr)
            paramsArr.append(paramChain)
        }
    }

    private func createParams(http: APIClient.HTTPVerbs, fullURLStr:String? = nil){
        if(http == .get){
            if(getParamsArr.count > 0){
                guard let url = fullURLStr else{ return}
                guard var components = URLComponents(string: url) else {return}
                components.queryItems = getParamsArr.map { (key, value) in
                    URLQueryItem(name: key, value: value)
                }
                components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
                self.components = components
            }
        }else{
            if(paramsArr.count > 0){
                params = paramsArr.joined(separator: "&")
            }
        }
    }
    
    func makeAuthRequest(){
        makeRequest(rote: .user, method: "", http: .get)
    }
    
    func makeRequest(rote: APIClient.Rotes, method: String, http: APIClient.HTTPVerbs){
        let Network = NetworkManager( rote: rote, method: method, http:http )
        createParams(http:http, fullURLStr:Network.fullURLStr)
        Network.prepareURLRequest(params:self.params, components:components)
        guard let request = Network.request else {return}
        URLSession.shared.dataTask(with:request) { (data, response, error) in
            guard let data = data, error == nil else {
                print("error=\(String(describing: error))")
                return
            }
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                print("statusCode should be 200, but is \(httpStatus.statusCode) response = \(String(describing: response))")
            }
            if let responseObject = (try? JSONSerialization.jsonObject(with: data)) as? [[String: Any]]{
                //self.delegate?.parseData(data: responseObject)
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: NOTIFICATION_PRODUCTS_LOADED), object: nil, userInfo: ["data":responseObject])
            }
        }.resume()
    }
}
