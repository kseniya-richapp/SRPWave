//
//  ProductsListViewController.swift
//  WaveExam
//
//  Created by Ksyunia on 24/02/2018.
//  Copyright © 2018 Ksyunia Efimova. All rights reserved.
//

import UIKit

class ProductsListViewController: UIViewController {

    @IBOutlet weak var listTitle: UILabel!
    @IBOutlet weak var productsDelegate: ProductsDataManager!
    @IBOutlet weak var tblVwProducts: UITableView!
    var DataM = DataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableProductList()
        listTitle.text = DataM.setListTitle()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(loadList), name: NSNotification.Name(rawValue: NOTIFICATION_PRODUCTS_LOADED), object: nil)
    }
    
    
    @objc func loadList(notification: NSNotification) {
        DataM.readProducts(notification:notification)
        DispatchQueue.main.async(execute: {
            self.tblVwProducts.reloadData()
        })
        
    }
    
    func setTableProductList(){
        tblVwProducts.delegate = productsDelegate
        tblVwProducts.dataSource = productsDelegate
        tblVwProducts.alwaysBounceVertical = false
        tblVwProducts.tableFooterView = UIView()
        productsDelegate.DataM = DataM
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
