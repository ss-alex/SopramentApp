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
    //@EnvironmentObject var truth: SourceOfTruth
    
    private var db: Connection?
    
    //MARK:- Column names:
    let name = Expression<String>("name")
    let title = Expression<String>("title")
    let gost = Expression<String>("room")
    let certificate = Expression<String>("certificate")
    let kilo = Expression<Double>("kilogram")
    let meter = Expression<Double>("meter2")
    let label = Expression<String>("label")
    let kg = Expression<String>("kg")
    let mt = Expression<String>("mt")
    let m2 = Expression<String>("m2")
    
    //MARK:- Properties:
    let tableNameString: String
    let materialCategory: MaterialCategoryModel
    let materialTable: Table
    
    var itemRow: Row?
    
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
    
    func fetchItemRow(name: String) -> Row? {
        do {
            let query = materialTable.filter(self.name == name)
            let data = try db?.pluck(query)
            return data
            
        } catch {
            print("DataModel. listItemEntities(). Error happened = \(error) ")
            return nil
        }
    }
    
    /*func listItemEntites(name: String) {
        itemRow = fetchItemRow(name: name)
        print("DataModel. listItemEntites(). itemRow = \(itemRow)")
        
        let itemTitle = itemRow?[title]
        print("DataModel. listItemEntities(), itemTitle = \(itemTitle)")
        
        /*let rowDataName = rowData![name]
        print("DataModel. name = \(rowDataName)")
        
        let rowDataTitle = rowData![title]
        print("DataModel. title = \(rowDataTitle)")
        
        let rowDataGost = rowData![gost]
        print("DataModel. gost = \(rowDataGost)")
        
        let rowDataCertificate = rowData![certificate]
        print("DataModel. certificate = \(rowDataCertificate)")
        
        let rowDataKilo = rowData![kilo]
        print("DataModel. kilo = \(rowDataKilo)")
        
        let rowDataMeter = rowData![meter]
        print("DataModel. meter = \(rowDataMeter)")
        
        let rowDataLabel = rowData![label]
        print("DataModel. label = \(rowDataLabel)")
        
        let rowDataKg = rowData![kg]
        print("DataModel. kg = \(rowDataKg)")
        
        let rowDataMt = rowData![mt]
        print("DataModel. mt = \(rowDataMt)")
        
        let rowDataM2 = rowData![m2]
        print("DataModel. m2 = \(rowDataM2)")*/
    }*/
    
}
