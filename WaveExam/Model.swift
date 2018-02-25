//
//  Model.swift
//  WaveExam
//
//  Created by Ksyunia on 24/02/2018.
//  Copyright © 2018 Ksyunia Efimova. All rights reserved.
//

/*
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

 */

import Foundation
import RealmSwift

class ProductRealm:Object{
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    @objc dynamic var price:Float = 0.0
    @objc dynamic var currency = currencyEnum.dollarr.rawValue

}
