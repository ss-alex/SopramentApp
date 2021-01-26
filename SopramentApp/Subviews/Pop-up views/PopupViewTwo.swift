//
//  MaterialSpecsPopupView.swift
//  SopramentApp
//
//  Created by Лена Мырленко on 2021/1/8.
//

import SwiftUI


struct MaterialItem: Identifiable {
    var id = UUID()
    var name: String
}

struct ItemRow: View {
    var item: MaterialItem
    @EnvironmentObject var truth: SourceOfTruth
    
    var model: DataModel
    
    var body: some View {
        Text(item.name)
            .onTapGesture {
            
                truth.isImageTapped = false // to close the PopupViewTwo
                truth.itemName = item.name
                truth.isItemPicked = true
                print("ItemRow. truth.itemName = \(truth.itemName)")
                
                model.setupDB()
                
                let row = model.fetchItemRow(name: truth.itemName)
                
                let title2 = row?[model.title]
                let gost = row?[model.gost]
                let certificate = row?[model.certificate]
                let kilo = row?[model.kilo]
                let meter = row?[model.meter]
                let label = row?[model.label]
                let kg = row?[model.kg]
                let mt = row?[model.mt]
                let m2 = row?[model.m2]
                
                truth.itemTitle = title2!
                truth.itemGost = gost!
                truth.itemCertificate = certificate!
                truth.itemKilo = kilo!
                truth.itemMeter = meter!
                truth.itemLabel = label!
                truth.itemKg = kg!
                truth.itemMt = mt!
                truth.itemM2 = m2!
                
                //Checking what works, what doesn't:
                print("ItemRow. model.fetchItemRow(). row = \(row)")
                print("ItemRow. truth.itemTitle = \(truth.itemTitle)")
                print("ItemRow. truth.itemGost = \(truth.itemGost)")
                print("ItemRow. truth.itemCertificate = \(truth.itemCertificate)")
                print("ItemRow. truth.itemKilo = \(truth.itemKilo)")
                print("ItemRow. truth.itemMeter = \(truth.itemMeter)")
                print("ItemRow. truth.itemLabel = \(truth.itemLabel)")
                print("ItemRow. truth.itemKg = \(truth.itemKg)")
                print("ItemRow. truth.itemMt = \(truth.itemMt)")
                print("ItemRow. truth.itemM2 = \(truth.itemM2)")
                
            }
    }
}

struct PopupViewTwo: View {
    
    @EnvironmentObject var truth: SourceOfTruth
    var model: DataModel
    
    var body: some View {
        
        let itemsArray = truth.itemsNameArray
        
        ZStack {
            VStack {
                List {
                    ForEach(itemsArray) { item in 
                        ItemRow(item: item, model: model)
                    }
                }
            }
        }
        .frame(width: 300, height: 500, alignment: .center)
        .background(Color.gray)
    }
}
