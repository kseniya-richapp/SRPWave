//
//  ProductsDataManager.swift
//  WaveExam
//
//  Created by Ksyunia on 24/02/2018.
//  Copyright © 2018 Ksyunia Efimova. All rights reserved.
//

import UIKit

class ProductsDataManager: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    var DataM:DataManager?
    let cellIdentifier = "productCell"
    let sections = 1
    let height:CGFloat = 65.0
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let DataM = DataM else {return 0}
        return DataM.productsArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let DataM = DataM else {return UITableViewCell()}
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ProductTableViewCell{
            if(DataM.productsArr.count > indexPath.row){
                cell.loadData(name: DataM.productsArr[indexPath.row].name, price: DataM.productsArr[indexPath.row].price, currency: DataM.productsArr[indexPath.row].currency)
                //cell.textLabel?.text = DataM.productsArr[indexPath.row].name
                //cell.detailTextLabel?.text = "\(DataM.productsArr[indexPath.row].currency)\(price)"
                return cell
            }
        }
        
        return UITableViewCell()
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return height
//    }
//    
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        return UIView()
//    }
//    
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 0
//    }
    
}
