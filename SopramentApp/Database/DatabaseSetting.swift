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

class DataModel {
    private var db: Connection?
    
    //MARK:- Column names:
    let name = Expression<String>("name")
    
    //MARK:- Properties:
    let tableNameString: String
    let materialCategory: MaterialCategoryModel
    let materialTable: Table
    
    //var namesArray = [String]()
    
    init(tableNameString: String) {
        self.tableNameString = tableNameString
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
    
    func listItemsName() -> [MaterialItem]  {
        do {
            
            return try db!.prepare(materialTable).map { material in
                return MaterialItem(name: material[name])
            }
            
        } catch {
            print("DataModel. listMaterialsName2(). Can't list materials name.")
            return []
        }
    }
    
}

extension DataModel {
    
    func listItemEntities(name: String) -> Row? {
        do {
            let query = materialTable.filter(self.name == name)
            let data = try db?.pluck(query)
            return data
            
        } catch {
            print("DataModel. listItemEntities(). Error happened = \(error) ")
            return nil
        }
    }
    
}
