//
//  APIClient.swift
//  WaveExam
//
//  Created by Ksyunia on 24/02/2018.
//  Copyright © 2018 Ksyunia Efimova. All rights reserved.
//
//configured with a networking manager to actually PERFORMED REQUEST
//signing every request with authentication token/credentials

/*
 
 The access token allows you to make requests to the API on a behalf of a user.
 
 You can provide the access token in the query string using the access_token parameter
 
 curl -X GET https://api.waveapps.com/user?access_token=ACCESS_TOKEN
 or the more preferred method of using the headers
 
 4. Expired tokens and refreshing
 An access token will expire in the time defined by expires_in in the response from Step 2.
 
 If a token has expired you will need to refresh it using the current refresh_token to generate a new access_token.
 
 Use the refresh_token from Step 2 to get a new access_token and refresh_token. Once this is done the previous refresh_token is invalidated.
 
 POST https://api.waveapps.com/oauth2/token/
 
 Name	Type	Description
 client_id	string	Required. The client ID you received from Wave when you registered.
 client_secret	string	Required. The client secret you received from Wave when you registered.
 refresh_token	string	Required. The code you received as a response to Step 2.
 grant_type	string	Required. Set to refresh_token.
 redirect_uri	string	Required. The URL in your app where users will be sent after authorization. See details below about Redirect URIs.
 scope	string	A subset of Scopes from Step 1 can be provided. If not provided it defaults to the scopes from Step 1.
 
 response: This will generate a new access_token and new refresh_token.
 
 {
 "access_token": "hUp7BcXHVUQj3TVcsstzwqJDmv0zZ6",
 "token_type": "Bearer",
 "expires_in": 36000,
 "refresh_token": "Bdmw3pKJB69UaZtId9aAo7Bk7H8Ua6",
 "scope": "basic"
 }
 
 curl https://api.waveapps.com/businesses/dd921fea-bef8-4281-a400-abefe265b601/products/ \
 -H "Authorization: Bearer ACCESS_TOKEN"
 -----------------------------------
 In this project, we're going to be creating a simple app that shows a Wave user the products that they can charge for on their invoices.
 
 You'll be using the public Wave API in this challenge. You can find the documentation here. You will specifically be interested in the products endpoint, and using an access token with the API.
 
 Your Wave contact will supply you with a business ID and a Wave API token before you begin.
 business_id: 89746d57-c25f-4cec-9c63-34d7780b044b
 access_token: 6W9hcvwRvyyZgPu9Odq7ko8DSY8Nfm
 
 What your application must do:
 
 Your app must retrieve the list of products for the specific business ID sent to you by your Wave contact
 The list of products should be fetched and shown to the user in a list view when the app is launched.
 Each item in the list view should show the product name and price (formatted as a dollar amount.)
 You are not required to add any interactivity to the app -- i.e. you do not need to send the user to a detail view when they touch one of the list items.
 
 Your app is allowed to render nothing if there is no internet connection when it loads.
 
 Once you're done, please submit a paragraph or two in your README about what you are particularly proud of in your implementation, and why.
 curl -X GET https://api.waveapps.com/user/ \\
 -H "Authorization: Bearer ACCESS_TOKEN"
 */
import UIKit

struct APIClient {
    
    private var devMode:Bool = false
    
    private struct Domains {
        static let devUrlStr = "https://api.waveapps.com"
        static let productionUrlStr = "https://api.waveapps.com"
    }
    
    private static var baseUrlStr = Domains.devUrlStr
    
    enum Rotes: String{
        case business =  "businesses"
        case user = "user"
    }
    
    enum HTTPVerbs: String{
        case post =  "POST"
        case get = "GET"
        case head = "HEAD"
        case delete = "DELETE"
    }
    
    let access_token = "6W9hcvwRvyyZgPu9Odq7ko8DSY8Nfm"
    static var authTitle = "Authorization"
    static var authValue = ""
    static var http = ""
    
    func getBaseUrl(rote:Rotes) -> String{
        if(!self.devMode) {
            APIClient.baseUrlStr = Domains.productionUrlStr
        }
        let url = "\(APIClient.baseUrlStr)/\(rote.rawValue)/"
        return url
    }
    
    func prepareAuth(http:HTTPVerbs = .get){
//        guard let tokenInfo = self.access_token.data(using: String.Encoding.utf8) else{
//            return
//        }
        //let base64AccessToken = tokenInfo.base64EncodedString()
        APIClient.authValue = "Bearer \(access_token)"
        APIClient.http = http.rawValue
    }
    
}
