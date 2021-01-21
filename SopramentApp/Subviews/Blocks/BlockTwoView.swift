//
//  BlockTwoView.swift
//  SopramentApp
//
//  Created by Alexey Kirpichnikov on 2020/12/21.
//

import SwiftUI

struct BlockTwoVStackTwo: View {
    var body: some View {
        VStack {
            HStackInputBlock(firstElement: "mt:",
                             inputNumber: Int(8552.77))
            HStackCalculatedBlock(inputNumber: 0,
                                  calculatedNumber: 0)
            HStackInputBlock(firstElement: "кг:",
                             inputNumber: Int(86554))
            HStackCalculatedBlock(inputNumber: 3456,
                                  calculatedNumber: 299130624)
            HStackInputBlock(firstElement: "m2:",
                             inputNumber: Int(4960.6))
            HStackCalculatedBlock(inputNumber: 0,
                                  calculatedNumber: 0)
        }
    }
}

struct HStackInputBlock: View {
    var firstElement: String
    var inputNumber: Int
    
    var body: some View {
        HStack(spacing: 0) {
            Text(firstElement)
                .frame(width: 80, height: 40, alignment: .leading)
                .background(Color(.orange))
            Text("\(inputNumber)")
                .frame(width: 200, height: 40, alignment: .center)
                .background(Color(.blue))
        }
    }
}

struct HStackCalculatedBlock: View {
    var inputNumber: Int
    var calculatedNumber: Int
    
    var body: some View {
        HStack(spacing: 0) {
            Text("\(inputNumber)")
                .frame(width: 80, height: 40, alignment: .leading)
                .background(Color(.systemOrange))
            Text("\(calculatedNumber)")
                .frame(width: 200, height: 40, alignment: .center)
                .background(Color(.systemBlue))
        }
    }
}

struct BlockTwoVStackOne: View {
    @EnvironmentObject var truth: SourceOfTruth
    @State var isImageTapped = false
    
    var model: DataModel
    
    var tableString: String
    /*var tableString: String {
        return truth.setTableName()
    }*/
    
    init(tableNameString: String) {
        
        //self.tableString = truth.materialTableName
        //self.model = DataModel(tableNameString: "beams_b_ru")
        
        self.tableString = tableNameString
        self.model = DataModel(tableNameString: tableString)
        
        /*switch truth.materialTableName {
        case "beams_b_ru":
            self.model = DataModel(tableNameString: "beams_b_ru")
        default:
            self.model = DataModel(tableNameString: "beams_b_ru")
        }*/
        
    }
    
    var body: some View {
        
        ZStack {
            VStack {
                Spacer()
                    .frame(width: 100, height: 40)
                    .background(Color(.green))
                truth.setPicture()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 160)
                    .background(Color(.gray))
                    .onTapGesture {
                        print("BlockTwoVStackOne. MaterialSpecsPopupView called on tap gesture.")
                        truth.isImageTapped = true
                        model.setupDB()
                    }
                Spacer()
                    .frame(width: 100, height: 40)
                    .background(Color(.green))
            }
        }
        
        if truth.isImageTapped {
            MaterialItemsPopupView()
        }
    }
}

struct BlockTwoHStackCombined: View {
    
    @EnvironmentObject var truth: SourceOfTruth
    
    var body: some View {
        HStack(spacing:30) {
            BlockTwoVStackOne(tableNameString: truth.materialTableName)
            BlockTwoVStackTwo()
        }
        .frame(width: 380, height: 240)
    }
}
