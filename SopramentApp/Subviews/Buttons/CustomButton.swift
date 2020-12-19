//
//  CustomButton.swift
//  SopramentApp
//
//  Created by Alexey Kirpichnikov on 2020/12/18.
//

import SwiftUI

struct CustomButton: View {
    var body: some View {
        Text("A")
            .font(.title3)
            .fontWeight(.regular)
            .frame(width: 40, height: 30)
            .foregroundColor(.black)
            .background(Color.gray)
            .cornerRadius(8)
    }
}

struct ButtonsHStack: View {
    var body: some View {
        HStack(spacing: 20) {
            CustomButton()
            CustomButton()
            CustomButton()
            CustomButton()
        }
        .padding(10)
    }
}

struct ButtonsVStack: View {
    var body: some View {
        VStack(spacing: 0) {
            ButtonsHStack()
            ButtonsHStack()
            ButtonsHStack()
            ButtonsHStack()
        }
    }
}

