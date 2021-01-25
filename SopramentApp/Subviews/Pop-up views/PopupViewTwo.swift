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
                //User logic:
                truth.isImageTapped = false // to close the PopupViewTwo
                truth.itemName = item.name
                truth.isItemPicked = true
                
                let x = model.listItemEntities(name: truth.itemName)
                
                let name = x?[model.name]
                print("ItemRow. name = \(name)")
                //truth.name = name!
                //print("ItemRow. truth.name = \(truth.name)")
                
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
