//
//  CustomButton.swift
//  SopramentApp
//
//  Created by Alexey Kirpichnikov on 2020/12/18.
//

import SwiftUI

struct MaterialButton: View {
    
    var letter: String
    
    var body: some View {
        Text("\(letter)")
            .font(.title3)
            .fontWeight(.regular)
            .frame(width: 40, height: 30)
            .foregroundColor(.black)
            .background(Color.gray)
            .cornerRadius(8)
    }
}

struct ButtonsHStackOne: View {
    var body: some View {
        HStack(spacing: 20) {
            MaterialButton(letter: "A")
            MaterialButton(letter: "B")
            MaterialButton(letter: "C")
            MaterialButton(letter: "D")
        }
        .padding(10)
    }
}

struct ButtonsHStackTwo: View {
    var body: some View {
        HStack(spacing: 20) {
            MaterialButton(letter: "E")
            MaterialButton(letter: "F")
            MaterialButton(letter: "G")
            MaterialButton(letter: "H")
        }
        .padding(10)
    }
}

struct ButtonsHStackThree: View {
    var body: some View {
        HStack(spacing: 20) {
            MaterialButton(letter: "I")
            MaterialButton(letter: "J")
            MaterialButton(letter: "K")
            MaterialButton(letter: "L")
        }
        .padding(10)
    }
}

struct ButtonsVStack: View {
    var body: some View {
        VStack(spacing: 0) {
            ButtonsHStackOne()
            ButtonsHStackTwo()
            ButtonsHStackThree()
        }
    }
}

