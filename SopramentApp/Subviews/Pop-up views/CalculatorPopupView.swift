//
//  CalculatorPopupView.swift
//  SopramentApp
//
//  Created by Alexey Kirpichnikov on 2021/1/27.
//

import SwiftUI

struct CalculatorPopupView: View {
    @EnvironmentObject var truth: SourceOfTruth
    
    var body: some View {
        ZStack {
            VStack {
                //Text("Hello")
                TextField("Enter data", text: Binding(
                            get: {String(truth.inputValue)},
                            set: {v in truth.inputValue = Int(v) ?? 0}
                ))
            }
        }
        .frame(width: 300, height: 200)
        .cornerRadius(20).shadow(radius: 20)
        .background(Color.white)
    }
}
