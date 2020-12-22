//
//  BlockOneView.swift
//  SopramentApp
//
//  Created by Alexey Kirpichnikov on 2020/12/19.
//

import SwiftUI

struct BlockOneView: View {
    var body: some View {
        VStack {
            HStackOne()
            HStackFour()
        }
    }
}

struct HStackOne: View {
    var body: some View {
        HStack {
            Spacer()
            Text("Швеллер 20Л")
                .frame(width: 240, height: 40)
                .background(Color.yellow)
        }
    }
}

struct HStackTwo: View {
    var body: some View {
        HStack {
            Text("1 мп:")
                .background(Color.orange)
            Text("кг:")
                .background(Color.green)
            Text("10.12")
                .background(Color.orange)
            Text("m2")
                .background(Color.green)
            Text("0.58")
                .background(Color.orange)
        }
        .frame(width: 240, height: 40)
        .background(Color.blue)
    }
}

struct HStackThree: View {
    var body: some View {
        HStack {
            Text("ГОСТ")
                .frame(width: 80, height: 40)
                .background(Color.orange)
            Text("8240-97")
                .frame(width: 160, height: 40, alignment: .leading)
                .background(Color.green)
        }
        .background(Color.gray)
    }
}

struct VStackOne: View {
    var body: some View {
        VStack {
            HStackTwo()
            HStackThree()
        }
    }
}

struct HStackFour: View {
    var body: some View {
        HStack {
            Image(systemName: "heart.fill")
                .frame(width: 80, height: 80,alignment: .center)
                .background(Color.pink)
            VStackOne()
        }
    }
}


