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
                let x = model.fetchItemRow(name: truth.itemName)
                print("ItemRow. model.fetchItemRow(). fetched row = \(x)")
                let y = x?[model.title]
                print("y = \(y)")
                truth.itemTitle = y!
                let z = truth.itemTitle
                print("z = \(z)")
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
