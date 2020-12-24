//
//  CustomButton.swift
//  SopramentApp
//
//  Created by Alexey Kirpichnikov on 2020/12/18.
//

import SwiftUI

struct MaterialButton: View {
    
    var letter: String
    var index: Int
    
    var body: some View {
        Button {
            print("MaterialButton was tapped")
            print("MaterialButton letter - \(letter), index - \(index)")
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








