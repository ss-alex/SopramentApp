//
//  PrisePopupView.swift
//  SopramentApp
//
//  Created by Alexey Kirpichnikov on 2021/1/31.
//

import SwiftUI
import Combine

struct PrisePopup: View {
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
                        print("PrisePopupView. mt button was tapped.")
                        truth.priseInputMt = value
                        truth.recalculatedMt = truth.priseInputMt * truth.mtValue
                        print("PrisePopupView. truth.priceInputMt = \(truth.priseInputMt).")
                        print("PrisePopupView. truth.recalculatedMt = \(truth.recalculatedMt)")
                        truth.isMtInputDone = true
                        truth.isToShowPrisePopup = false
                        
                    } label: {
                        Text("mt")
                            .frame(width: 80, height: 30)
                            .foregroundColor(.white)
                            .background(Color.black)
                    }
                    
                    Button {
                        print("PrisePopupView. kg button was tapped.")
                        truth.priseInputKg = value
                        truth.recalculatedKg = truth.priseInputKg * truth.kgValue
                        print("PrisePopupView. truth.priceInputKg = \(truth.priseInputKg).")
                        print("PrisePopupView. truth.recalculatedKg = \(truth.recalculatedKg)")
                        truth.isKgInputDone = true
                        truth.isToShowPrisePopup = false
                        
                    } label: {
                        Text("kg")
                            .frame(width: 80, height: 30)
                            .foregroundColor(.white)
                            .background(Color.black)
                    }
                    
                    Button {
                        print("PrisePopupView. m2 button was tapped.")
                        truth.priseInputM2 = value
                        truth.recalculatedM2 = truth.priseInputM2 * truth.m2Value
                        print("PrisePopupView. truth.priseInputM2 = \(truth.priseInputM2).")
                        print("PrisePopupView. truth.recalculatedM2 = \(truth.recalculatedM2)")
                        truth.isM2InputDone = true
                        truth.isToShowPrisePopup = false
                        
                    } label: {
                        Text("m2")
                            .frame(width: 80, height: 30)
                            .foregroundColor(.white)
                            .background(Color.black)
                    }
                }
                
                Spacer()
            }
        }
        .frame(width: 300, height: 200)
        .cornerRadius(20).shadow(radius: 10)
        .background(Color.gray)
    }
}


