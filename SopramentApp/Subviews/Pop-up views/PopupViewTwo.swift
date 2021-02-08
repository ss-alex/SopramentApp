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


struct PopupViewTwo: View {
    @EnvironmentObject var truth: SourceOfTruth
    var model: DataModel
    
    var body: some View {
        let itemsArray = truth.itemNamesArray
        
        List {
            ForEach(itemsArray) { item in
                ItemRow(item: item, model: model)
            }
        }
        .frame(width: 300, height: 500)
    }
}

struct ItemRow: View {
    var item: MaterialItem
    @EnvironmentObject var truth: SourceOfTruth
    
    var model: DataModel
    
    var body: some View {
        Text(item.name)
            .onTapGesture {
                truth.itemName = item.name
                truth.fetchItemEntities(model: model)
                truth.isImageTapped = false
                truth.isItemPicked = true
            }
    }
}
