//
//  BlockTwoView.swift
//  SopramentApp
//
//  Created by Alexey Kirpichnikov on 2020/12/21.
//

import SwiftUI

struct ItemImagePlusCalculatorView: View {
    @EnvironmentObject var truth: SourceOfTruth
    
    var body: some View {
        HStack(spacing:30) {
            ImageVStack(tableNameString: truth.materialTableName)
            CalculatorVStack()
        }
        .frame(width: 380, height: 240)
    }
}

struct ImageVStack: View {
    
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
                    //.background(Color(.green))
                
                truth.setPicture()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 160)
                    //.background(Color(.gray))
                    .onTapGesture {
                        print("BlockTwoVStackOne. MaterialSpecsPopupView called on tap gesture.")
                        truth.isImageTapped = true
                        model.setupDB()
                        truth.itemsNameArray = model.listItemsName()
                        print("BlockTwoVStackOne. truth.materialsNameArray = \(truth.itemsNameArray)")
                    }
                
                Spacer()
                    .frame(width: 100, height: 40)
                    //.background(Color(.green))
            }
        }
        
        if truth.isImageTapped {
            PopupViewTwo(model: model)
        }
    }
}

struct CalculatorVStack: View {
    @EnvironmentObject var truth: SourceOfTruth
    
    var body: some View {
        VStack {
            CalculatorOutputRow(firstElement: truth.isItemPicked ? "\(truth.itemMt)" : "",
                                secondElement: truth.isItemPicked ? "\(truth.mtValue.roundedInTwo)" : "")
            
            PriseOutputRow(inputNumber: truth.isMtInputDone ? "\(truth.priseInputMt.roundedInTwo)" : "",
                           calculatedNumber: truth.isMtInputDone ? "\(truth.recalculatedMt.roundedInTwo)" : "")
            
            CalculatorOutputRow(firstElement: truth.isItemPicked ? "\(truth.itemKg)" : "",
                                secondElement: truth.isItemPicked ? "\(truth.kgValue.roundedInTwo)" : "")
            
            PriseOutputRow(inputNumber: truth.isKgInputDone ? "\(truth.priseInputKg.roundedInTwo)" : "",
                           calculatedNumber: truth.isKgInputDone ? "\(truth.recalculatedKg.roundedInTwo)" : "")
            
            CalculatorOutputRow(firstElement: truth.isItemPicked ? "\(truth.itemM2)" : "",
                                secondElement: truth.isItemPicked ? "\(truth.m2Value.roundedInTwo)" : "")
            
            PriseOutputRow(inputNumber: truth.isM2InputDone ? "\(truth.priseInputM2.roundedInTwo)" : "",
                           calculatedNumber: truth.isM2InputDone ? "\(truth.recalculatedM2.roundedInTwo)" : "")
        }
        .onTapGesture {
            truth.isCalcualtorPopupShown = true
            print("CalculatorVStack. isCalculatorPopupView = \(truth.isCalcualtorPopupShown)")
        }
    }
}

struct CalculatorOutputRow: View {
    var firstElement: String
    var secondElement: String
    
    var body: some View {
        HStack(spacing: 0) {
            Text(firstElement)
                .frame(width: 80, height: 40, alignment: .leading)
                //.background(Color(.orange))
            Text(secondElement)
                .frame(width: 200, height: 40, alignment: .center)
                //.background(Color(.blue))
        }
    }
}

struct PriseOutputRow: View {
    var inputNumber: String
    var calculatedNumber: String
    
    var body: some View {
        HStack(spacing: 0) {
            Text(inputNumber)
                .frame(width: 80, height: 40, alignment: .leading)
                .foregroundColor(.orange)
                //.background(Color(.systemOrange))
            Text(calculatedNumber)
                .frame(width: 200, height: 40, alignment: .center)
                .foregroundColor(.blue)
                //.background(Color(.systemBlue))
        }
    }
}

