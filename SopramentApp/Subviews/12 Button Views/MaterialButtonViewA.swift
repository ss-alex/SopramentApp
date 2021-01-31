//
//  MaterialButtonViewA.swift
//  SopramentApp
//
//  Created by Alexey Kirpichnikov on 2020/12/24.
//

import SwiftUI

struct MaterialCategory: Identifiable {
    var id = UUID()
    var name: String
    var imageName: String
    var tableName: String
}

struct CategoryRow: View {
    var category: MaterialCategory
    @EnvironmentObject var truth: SourceOfTruth
    
    var body: some View {
        Text(category.name)
            .onTapGesture {
                print("MaterialRow. Material.imageName = \(category.imageName)")
                
                //User logic:
                truth.isPopupViewOneShown = false
                truth.isMaterialPictureShown = true
                truth.imageName = category.imageName
                truth.materialTableName = category.tableName /// передает имя табл
            }
    }
}

struct MaterialButtonViewA: View {
    
    @EnvironmentObject var truth: SourceOfTruth
    
    let categoryOne = MaterialCategory(name: "- балочный (Б)",
                               imageName: "iv_d1",
                               tableName: "beams_b_ru")
    let categoryTwo = MaterialCategory(name: "- широкополочный (Ш)",
                               imageName: "iv_d2",
                               tableName: "")
    let categoryThree = MaterialCategory(name: "- колонный (К)",
                                 imageName: "iv_d3",
                                 tableName: "")
    let categoryFour = MaterialCategory(name: "- доп. балочный (ДБ)",
                                imageName: "iv_d4",
                                tableName: "")
    let categoryFive = MaterialCategory(name: "- доп. колонный (ДК)",
                                imageName: "iv_d3",
                                tableName: "")
    let categorySix = MaterialCategory(name: "- свайный (С)",
                               imageName: "iv_d5",
                               tableName: "")
    let categorySeven = MaterialCategory(name: "- балочный (БТ)",
                                 imageName: "iv_d6",
                                 tableName: "")
    let categoryEight = MaterialCategory(name: "- широкополочный (ШТ)",
                                 imageName: "iv_d6",
                                 tableName: "")
    let categoryNine = MaterialCategory(name: "- колонный (КТ)",
                                imageName: "iv_d6",
                                tableName: "")
    
    
    var body: some View {
        
        let materialsGroupOne = [categoryOne, categoryTwo, categoryThree, categoryFour, categoryFive, categorySix]
        
        let materialsGroupTwo = [categorySeven, categoryEight, categoryNine]
        
        ZStack {
            VStack {
                List {
                    Section(header: Text("Двутавр")) {
                        ForEach(materialsGroupOne) { category in
                            CategoryRow(category: category)
                        }
                    }
                    
                    Section(header: Text("Тавр")) {
                        ForEach(materialsGroupTwo) { material in
                            CategoryRow(category: material)
                        }
                    }
                    
                }
                
                Button {
                    truth.isPopupViewOneShown = false
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
