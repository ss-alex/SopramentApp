//
//  CalculatorPopupView.swift
//  SopramentApp
//
//  Created by Alexey Kirpichnikov on 2021/1/27.
//

import SwiftUI
import Combine

struct CalculatorPopup: View {
    @EnvironmentObject var truth: SourceOfTruth
    @State private var value: Double = 0.0
    
    var body: some View {
        ZStack {
            return VStack {
                Spacer()
                
                Text("Enter data")
                    .foregroundColor(Color.red)
                
                Spacer()
                
                TextField("", value: $value, formatter: NumberFormatter())
                    .keyboardType(.decimalPad)
                    
                Spacer()
                
                HStack {
                    
                    Button {
                        truth.mtValue = 0
                        truth.kgValue = 0
                        truth.m2Value = 0
                        truth.quantityValue = value
                        truth.makeCalculation(with: InputType.quantity)
                        truth.isCalculationDone = true
                        truth.isCalcualtorPopupShown = false
                        
                    } label: {
                        Text("quantity")
                            .frame(width: 120, height: 30)
                            .background(Color.gray)
                    }
                    
                    Button {
                        truth.mtValue = 0
                        truth.kgValue = 0
                        truth.m2Value = 0
                        truth.kilogramValue = value
                        truth.isCalculationDone = true
                        truth.makeCalculation(with: InputType.kilogram)
                        truth.isCalcualtorPopupShown = false
                        
                    } label: {
                        Text("kilogram")
                            .frame(width: 120, height: 30)
                            .background(Color.gray)
                    }
                }
                
                Spacer()
            }
            .background(Color.secondary)
        }
        .frame(width: 300, height: 200)
        .cornerRadius(20).shadow(radius: 20)
        .background(Color.white)
    }
}


/*struct IntField: View {
    @State private var intString: String = ""
    @Binding var int: Int
    
    var body: some View {
        return TextField("", text: $intString)
            
        
            .onReceive(Just(intString)) { value in
                if let i = Int(value) {
                    int = i
                } else {
                    intString = "\(int)"
                }
            }
        
            .onAppear(perform: {
                intString = "\(int)"
            })
        
    }
}*/

/*TextField("Enter data", text: Binding(
    get: {String(truth.inputValue)},
    set: {v in truth.inputValue = Int(v) ?? 0}
))
.background(Color.yellow)
.keyboardType(.decimalPad)*/

//IntField(int: $testInt)
