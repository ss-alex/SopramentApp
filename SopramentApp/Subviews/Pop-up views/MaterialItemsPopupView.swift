//
//  MaterialSpecsPopupView.swift
//  SopramentApp
//
//  Created by Лена Мырленко on 2021/1/8.
//

import SwiftUI

/*struct MaterialSpec: Identifiable {
    var id = UUID()
    var name: String
}

struct MaterialSpecRow: View {
    var materialSpec: MaterialSpec
    
    var body: some View {
        Text("\(materialSpec.name)")
    }
}*/

struct MaterialItem: Hashable {
    let title: String
}

struct MaterialItemsPopupView: View {
    
    let materialItem = [MaterialItem]()
    
    var body: some View {
        ZStack {
            VStack {
                List {
                    Text("10 Б1 100*55")
                    Text("12 Б1 118*64")
                    Text("12 Б2 120*64")
                }
            }
        }
        .frame(width: 300, height: 500, alignment: .center)
        .background(Color.gray)
    }
}

