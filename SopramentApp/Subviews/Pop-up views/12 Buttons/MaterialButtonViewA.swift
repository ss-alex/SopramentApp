//
//  MaterialButtonViewA.swift
//  SopramentApp
//
//  Created by Лена Мырленко on 2020/12/24.
//

import SwiftUI

struct Material: Identifiable {
    var id = UUID()
    var name: String
    var imageName: String
}

struct MaterialRow: View {
    var material: Material
    @EnvironmentObject var truth: SourceOfTruth
    
    var body: some View {
        Text(material.name)
            .onTapGesture {
                print("\(material.imageName)")
                truth.isMaterialShown = false
                truth.isMaterialPictureShown = true
                truth.imageName = material.imageName
            }
    }
}

struct MaterialButtonViewA: View {
    
    @EnvironmentObject var truth: SourceOfTruth
    
    let materialOne = Material(name: "- балочный (Б)",
                               imageName: "iv_d1")
    let materialTwo = Material(name: "- широкополочный (Ш)",
                               imageName: "iv_d2")
    let materialThree = Material(name: "- колонный (К)",
                                 imageName: "iv_d3")
    let materialFour = Material(name: "- доп. балочный (ДБ)",
                                imageName: "iv_d4")
    let materialFive = Material(name: "- доп. колонный (ДК)",
                                imageName: "iv_d3")
    let materialSix = Material(name: "- свайный (С)",
                               imageName: "iv_d5")
    let materialSeven = Material(name: "- балочный (БТ)",
                                 imageName: "iv_d6")
    let materialEight = Material(name: "- широкополочный (ШТ)",
                                 imageName: "iv_d6")
    let materialNine = Material(name: "- колонный (КТ)",
                                imageName: "iv_d6")
    
    func handleTap(_ forMaterial: Material) {
        
    }
    
    var body: some View {
        
        let materialsGroupOne = [materialOne, materialTwo, materialThree, materialFour, materialFive, materialSix]
        
        let materialsGroupTwo = [materialSeven, materialEight, materialNine]
        
        ZStack {
            VStack {
                List {
                    Section(header: Text("Двутавр")) {
                        ForEach(materialsGroupOne) { material in
                            MaterialRow(material: material)
                        }
                    }
                    
                    Section(header: Text("Тавр")) {
                        ForEach(materialsGroupTwo) { material in
                            MaterialRow(material: material)
                        }
                    }
                }
                
                Button {
                    truth.isMaterialShown = false
                    print("MaterialButtonViewA. Ok button was tapped.")
                    
                } label: {
                    Text("AAA")
                }

            }
        }
        .background(Color.white)
        .frame(width: 300, height: 500, alignment: .center)
    }
}


/*Section(header: Text("I-bar")) {
    ForEach(0 ..< iBarEn.count) {
        Text(self.iBarEn[$0])
    }
}*/

/*Section(header: Text("T-bar")) {
    ForEach(0 ..< tBarRu.count) {
        Text(self.tBarRu[$0])
    }
}*/

/*private let iBarEn = ["- joist (J)",
                    "- broad-flange (H)",
                    "- column (UC)",
                    "- additional joist (A-J)",
                    "- additional column (A-UC)",
                    "- pile-supported (PS)",
                    "- joist (JT)",
                    "- broad-flange (HT)",
                    "- column (CT)"]*/

/*private let tBarEn = ["- joist (JT)",
                    "- broad-flange (HT)",
                    "column (CT)"]*/

/*private let iBarRu = ["- балочный (Б)",
                      "- широкополочный (Ш)",
                      "- колонный (К)",
                      "- доп. балочный (ДБ)",
                      "- доп. колонный (ДК)",
                      "- свайный (С)"]

private let tBarRu = ["- балочный (БТ)",
                      "- широкополочный (ШТ)",
                      "- колонный (КТ)"]*/

//let tap = TapGesture()
//    .onEnded { _ in
//        truth.isMaterialShown = false
//        truth.isMaterialPictureShown = true
//    }
