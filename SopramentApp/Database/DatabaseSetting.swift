//
//  DatabaseSetting.swift
//  SopramentApp
//
//  Created by Alexey Kirpichnikov on 2021/1/9.
//

import Foundation
import SQLite
import SwiftUI

struct MaterialCategoryModel {
    var tableName: Table
}

struct MaterialModel {
    let name: String
    init(name: String) { self.name = name }
}

class DataModel {
    private var db: Connection?
    
    //MARK:- Column names:
    let name = Expression<String>("name")
    
    //MARK:- Properties:
    var tableNameString: String
    let materialCategory: MaterialCategoryModel
    var materialTable: Table
    
    var namesArray = [String]()
    
    init(tableNameString: String) {
        self.tableNameString = tableNameString
        print("DataModel. init() tableNameString = \(tableNameString)")
        self.materialCategory = MaterialCategoryModel(tableName: Table("\(tableNameString)"))
        self.materialTable = materialCategory.tableName
    }
    
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
    }
}

extension DataModel {
    
    func listMaterialsName() {
        do {
            for material in try db!.prepare(materialTable) {
                print("DataModel.setupDB(). List all materials entities: \(material).")
                //print("DataModel.setupDB(). List of materials names: \(material[name])")
            }
        } catch {
            print("DataModel.setupDB(). Couldn't connect to a db and fetch results.")
        }
    }
    
    func listMaterialsName2()  {
        do {
            for material in try db!.prepare(materialTable) {
                namesArray.append(material[name])
            }
            
            print("DataModel. listMaterialsName2(). namesArray = \(namesArray).")
            
        } catch {
            print("DataModel. listMaterialsName2(). Can't list materials name.")
        }
    }
    
}
