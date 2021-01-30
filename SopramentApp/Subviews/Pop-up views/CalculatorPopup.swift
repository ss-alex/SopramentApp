//
//  CalculatorPopupView.swift
//  SopramentApp
//
//  Created by Alexey Kirpichnikov on 2021/1/27.
//

import SwiftUI
import Combine

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
                
                /*TextField("Enter data", text: Binding(
                    get: {String(truth.inputValue)},
                    set: {v in truth.inputValue = Int(v) ?? 0}
                ))
                .background(Color.yellow)
                .keyboardType(.decimalPad)*/
                
                //IntField(int: $testInt)
                
                TextField("", value: $value, formatter: NumberFormatter())
                    .keyboardType(.decimalPad)
                    
                
                Spacer()
                
                HStack {
                    
                    Button {
                        truth.quantityValue = value
                        print("CalculatorPopup. truth.quantityValue = \(truth.quantityValue) ")
                        truth.isCalcualtorPopupShown.toggle()
                        
                    } label: {
                        Text("quantity")
                            .frame(width: 120, height: 30)
                            .background(Color.gray)
                    }
                    
                    Button {
                        truth.kilogramValue = value
                        print("CalculatorPopup. truth.kilogramValue = \(truth.kilogramValue)")
                        truth.isCalcualtorPopupShown.toggle()
                        
                    } label: {
                        Text("kilogram")
                            .frame(width: 120, height: 30)
                            .background(Color.gray)
                    }
                }
                
                Spacer()
            }
        }
        .frame(width: 300, height: 200)
        .cornerRadius(20).shadow(radius: 20)
        .background(Color.white)
    }
}
