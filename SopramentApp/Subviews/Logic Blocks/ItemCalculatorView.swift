//
//  BlockTwoView.swift
//  SopramentApp
//
//  Created by Alexey Kirpichnikov on 2020/12/21.
//

import SwiftUI

struct BlockTwoVStackTwo: View {
    @EnvironmentObject var truth: SourceOfTruth
    
    var body: some View {
        VStack {
            //HStackInputBlock(firstElement: "mt:", inputNumber: Int(8552.77))
            HStackInputBlock(firstElement: truth.isItemPicked ? "\(truth.itemMt)" : "",
                             inputNumber: truth.isItemPicked ? "\(truth.mtFigure)" : "")
            
            HStackCalculatedBlock(inputNumber: 888,
                                  calculatedNumber: 888)
            
            HStackInputBlock(firstElement: truth.isItemPicked ? "\(truth.itemKg)" : "",
                             inputNumber: truth.isItemPicked ? "\(truth.kgFigure)" : "")
            
            HStackCalculatedBlock(inputNumber: 888,
                                  calculatedNumber: 888)
            
            HStackInputBlock(firstElement: truth.isItemPicked ? "\(truth.itemMeter2)" : "",
                             inputNumber: truth.isItemPicked ? "\(truth.meter2figure)" : "")
            
            HStackCalculatedBlock(inputNumber: 888,
                                  calculatedNumber: 888)
        }
    }
}

struct HStackInputBlock: View {
    var firstElement: String
    var inputNumber: String
    
    var body: some View {
        HStack(spacing: 0) {
            Text(firstElement)
                .frame(width: 80, height: 40, alignment: .leading)
                .background(Color(.orange))
            Text(inputNumber)
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
    
    var tableString: String
    var model: DataModel
    @EnvironmentObject var truth: SourceOfTruth
    
    @State var isImageTapped = false
    
    init(tableNameString: String) {
        self.tableString = tableNameString
        self.model = DataModel(tableNameString: tableString)
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
                        
                        //User logic:
                        truth.isImageTapped = true
                        model.setupDB()
                        truth.itemsNameArray = model.listItemsName()
                        print("BlockTwoVStackOne. truth.materialsNameArray = \(truth.itemsNameArray)")
                    }
                
                Spacer()
                    .frame(width: 100, height: 40)
                    .background(Color(.green))
            }
        }
        
        if truth.isImageTapped {
            PopupViewTwo(model: model)
        }
    }
}

struct ItemCalculatorView: View {
    @EnvironmentObject var truth: SourceOfTruth
    
    var body: some View {
        HStack(spacing:30) {
            BlockTwoVStackOne(tableNameString: truth.materialTableName)
            BlockTwoVStackTwo()
        }
        .frame(width: 380, height: 240)
    }
}
