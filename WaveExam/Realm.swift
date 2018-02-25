//
//  Realm.swift
//  WaveExam
//
//  Created by Ksyunia on 24/02/2018.
//  Copyright © 2018 Ksyunia Efimova. All rights reserved.
//

import Foundation
import RealmSwift

class RealmObj{

    static let shared = RealmObj()
    var realm:Realm?
    
    private init(){
        makeMigration()
        do {
            realm = try Realm()
        } catch let error as NSError {
            // handle error
            print("ERROR : \(error.localizedDescription)")
        }
        //print(NSHomeDirectory())
    }
    
    func makeMigration(){
        let config = Realm.Configuration(
            schemaVersion: 1,
            migrationBlock: { migration, oldSchemaVersion in
                // We haven’t migrated anything yet, so oldSchemaVersion == 0
                if (oldSchemaVersion < 1) {
                   
                }
        })
        Realm.Configuration.defaultConfiguration = config
    }
    
    func deleteAll(){
        guard let realm = self.realm else{return}
        do{
            try realm.write {
                realm.deleteAll()
            }
        }catch{
            print("ERROR : \(error.localizedDescription)")
        }
    }
    
    func delete(results:Results<ProductRealm>){
        guard let realm = self.realm else{return}
        do{
            try realm.write {
                realm.delete(results)
            }
        }catch{
            print("ERROR : \(error.localizedDescription)")
        }
    }
    
    func updateProductName(filterStr: String, name:String){
        guard let realm = self.realm else{return}
        DispatchQueue(label: "background").async {
            autoreleasepool {
                if let products = self.filterRealm(filterStr: filterStr){
                    guard let product = products.first else {return }
                    do{
                        try realm.write {
                            product.name = name
                        }
                    }catch{
                        print("ERROR : \(error.localizedDescription)")
                    }
                }
            }
        }
    }
    
    func write(obj:Object){
        guard let realm = self.realm else{return}
        do{
            try realm.write {
                realm.add(obj)
            }
        }catch{
            print("ERROR : \(error.localizedDescription)")
        }
    }
    
    func filterRealm(filterStr:String)->Results<ProductRealm>?{
        if let realm = self.realm{
            let products = realm.objects(ProductRealm.self)
            let result = products.filter(filterStr)
            return result
        }
        return nil
    }
    
    func read()->Results<ProductRealm>?{
        if let realm = self.realm{
            let products = realm.objects(ProductRealm.self)
            return products
        }
        return nil
    }
}
