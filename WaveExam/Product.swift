//
//  Product.swift
//  WaveExam
//
//  Created by Ksyunia on 24/02/2018.
//  Copyright © 2018 Ksyunia Efimova. All rights reserved.
//
/*
 [
 {
 
 
 "id": 1,
 "url": "https://api.waveapps.com/businesses/c2731e5c-5001-4fe3-87ae-477f9a48dfcc/products/1/",
 "name": "Erlenmeyer flask",
 "price": 17.0,
 "description": "The Erlenmeyer flask is the most common flask in the DVHS chemistry lab. It is used to contain reaction solutions.",
 "is_sold": true,
 "is_bought": false,
 "income_account": {
 "id": 10,
 "url": "https://api.waveapps.com/businesses/c2731e5c-5001-4fe3-87ae-477f9a48dfcc/accounts/10/",
 },
 "expense_account": null,
 "active": true,
 "default_sales_taxes": [],
 "date_created": "2013-12-05T17:22:51+00:00",
 "date_modified": "2013-12-05T17:22:51+00:00"
 },
 
 
 {
 "id": 2,
 "url": "https://api.waveapps.com/businesses/c2731e5c-5001-4fe3-87ae-477f9a48dfcc/products/2/",
 "name": "Beaker",
 "price": 9.0,
 "description": "Beakers are the most versatile glassware in the lab and can be used for just about anything. The volume graduations on beakers should be used only for 'ballpark' estimates.",
 "is_sold": true,
 "is_bought": false,
 "active": true,
 "income_account": {
 "id": 10,
 "url": "https://api.waveapps.com/businesses/c2731e5c-5001-4fe3-87ae-477f9a48dfcc/accounts/10/",
 },
 "expense_account": null,
 "default_sales_taxes": [],
 "date_created": "2013-12-05T17:23:17+00:00",
 "date_modified": "2013-12-05T17:23:17+00:00"
 },
 {
 "id": 3,
 "url": "https://api.waveapps.com/businesses/c2731e5c-5001-4fe3-87ae-477f9a48dfcc/products/3/",
 "name": "Methylamine",
 "price": 4000.0,
 "description": "The organic compound with a formula of CH3NH2",
 "is_sold": false,
 "is_bought": true,
 "income_account": null,
 "active": true,
 "expense_account": {
 "id": 27,
 "url": "https://api.waveapps.com/businesses/c2731e5c-5001-4fe3-87ae-477f9a48dfcc/accounts/27/",
 },
 "default_sales_taxes": [],
 "date_created": "2013-12-05T17:36:37+00:00",
 "date_modified": "2013-12-05T17:36:37+00:00"
 }
 ]
 */

import UIKit

class Product{
    var id = 0
    var name = ""
    var price:Float = 0.0
    var currency = currencyEnum.dollarr.rawValue
}
