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
                print("ItemRow. truth.itemName = \(truth.itemName)")
                
                model.setupDB()
                let row = model.fetchItemRow(name: truth.itemName)
            
                truth.itemTitle = row![model.title]
                truth.itemGost = row![model.gost]
                truth.itemCertificate = row![model.certificate]
                truth.itemKilo = row![model.kilo]
                truth.itemMeter2 = row![model.meter]
                truth.itemLabel = row![model.label]
                truth.itemKg = row![model.kg]
                truth.itemMt = row![model.mt]
                truth.itemM2 = row![model.m2]
                
                //Checking what works, what doesn't:
                print("ItemRow. model.fetchItemRow(). row = \(row)")
                print("ItemRow. truth.itemTitle = \(truth.itemTitle)")
                print("ItemRow. truth.itemGost = \(truth.itemGost)")
                print("ItemRow. truth.itemCertificate = \(truth.itemCertificate)")
                print("ItemRow. truth.itemKilo = \(truth.itemKilo)")
                print("ItemRow. truth.itemMeter = \(truth.itemMeter2)")
                print("ItemRow. truth.itemLabel = \(truth.itemLabel)")
                print("ItemRow. truth.itemKg = \(truth.itemKg)")
                print("ItemRow. truth.itemMt = \(truth.itemMt)")
                print("ItemRow. truth.itemM2 = \(truth.itemM2)")
                
                truth.isItemPicked = true
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
