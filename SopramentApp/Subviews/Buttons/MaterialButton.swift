//
//  CustomButton.swift
//  SopramentApp
//
//  Created by Alexey Kirpichnikov on 2020/12/18.
//

import SwiftUI

struct MaterialButton: View {
    @EnvironmentObject var truth: SourceOfTruth
    
    var buttonIndex: Int
    var letter: String
    
    var body: some View {
        Button {
            truth.index = self.buttonIndex
            truth.isPopupViewOneShown = true
            print("MaterialButton. The button \(letter) was tapped at truth.index - \(truth.index).")
            
        } label: {
            Text("\(letter)")
                .font(.title3)
                .fontWeight(.regular)
                .frame(width: 40, height: 30)
                .foregroundColor(.black)
                .background(Color.gray)
                .cornerRadius(8)
        }
    }
}








