//
//  DatabaseSetting.swift
//  SopramentApp
//
//  Created by Alexey Kirpichnikov on 2021/1/9.
//

import Foundation
import SQLite
import SwiftUI

struct MaterialTableModel {
    var tableName: Table
}

class DataModel {
    var tableNameString: String
    let currentMaterial: MaterialTableModel
    var materialTable: Table
    
    //MARK:- Column names:
    let name = Expression<String>("name")
    
    init(tableNameString: String) {
        self.tableNameString = tableNameString
        print("DataModel. init() tableNameString = \(tableNameString)")
        
        self.currentMaterial = MaterialTableModel(
            tableName: Table("\(tableNameString)"))
        self.materialTable = currentMaterial.tableName
    }
        
    private var db: Connection?
    
    func setupDB() {
        
        if db == nil {
            
            do {
                guard let path = Bundle.main.path(forResource: "assortment-V2", ofType: "sqlite") else
                {
                    print("DataModel.setupDB(). Path is equal nil.")
                    return
                }
                
                db = try Connection("\(path)")
                print("DataModel.setupDB(). DB opened.")
                print("DataModel.setupDB(). Path - \(path).")
                
            } catch {
                print("DataModel.setupDB(). Error connecting to a database \(error.localizedDescription)")
                
            }
        }
        
        do {
            /*for material in try db!.prepare(materials) {
                print("DataModel.setupDB(). List all materials entities: \(material).")
                print("DataModel.setupDB(). List of materials names: \(material[name])")
             }*/
            for material in try db!.prepare(materialTable) {
                print("DataModel.setupDB(). List all materials entities: \(material).")
            }
        } catch {
            print("DataModel.setupDB(). Couldn't connect to a db and fetch results.")
        }
    }
}



//import SQLite

/*enum TableNames: String {
    case beams_ru
}*/

/*class MaterialModel {
    static let tableName = "beams_b_ru"
}*/

/*class MaterialRepository {
    
    //var database: Connection!
    var database: Connection!
    
    //Setting the connection
    //let path = Bundle.main.path(forResource: "assortment-V2", ofType: "sqlite")
    //let db = try Connection("path", readonly: true)
    //private let db = Connection("path", readonly: true)
    
    //do {
    //    let db = try Connection("path", readonly: true)
    //} catch {
    //    print("MaterialRepository. db connection failed")
    //}
    
    init() {
        
        do {
            let path = Bundle.main.path(forResource: "assortment-V2", ofType: "sqlite")
            let database = try Connection(path!, readonly: true)
            self.database = database
            print("Database initialized at path \(path)")
        } catch {
            print("MaterialRepository. db connection failed.")
        }
    }
    
    //Columns
    let _id = Expression<Int64>("_id")
    let name = Expression<String>("name")
    let title = Expression<String>("title")
    let certificate = Expression<Int>("certificate")
    let kilogram = Expression<Int>("kilogram")
    let meter2 = Expression<Int>("meter2")
    let label = Expression<String>("label")
    let kg = Expression<String>("kg")
    let mt = Expression<String>("mt")
    let m2 = Expression<String>("m2")
}*/
