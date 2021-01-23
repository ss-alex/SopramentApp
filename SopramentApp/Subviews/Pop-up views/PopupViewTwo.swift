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
    
    var body: some View {
        Text(item.name)
    }
}

struct PopupViewTwo: View {
    
    @EnvironmentObject var truth: SourceOfTruth
    
    var body: some View {
        
        let itemsArray = truth.itemsNameArray
        
        ZStack {
            VStack {
                List {
                    
                    ForEach(itemsArray) { item in 
                        ItemRow(item: item)
                    }
                }
            }
        }
        .frame(width: 300, height: 500, alignment: .center)
        .background(Color.gray)
    }
}

//var materialItem = [MaterialItem]()
//private let model: DataModel

//init(model: DataModel) {
//    self.model = model
//}
