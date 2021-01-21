//
//  SopramentView.swift
//  SopramentApp
//
//  Created by Alexey Kirpichnikov on 2020/12/22.
//

import SwiftUI

struct SopramentView: View {
    
    @Binding var isSopramentViewShown: Bool
    
    var body: some View {
        ZStack {
            Color.gray
            VStack {
                Text("Версия :: 1.5")
                Spacer()
                Text("База данных :: 15.09.2020г")
                Spacer()
                Text("Документация :: 15.09.2020г")
                Spacer()
                Text("Разработчик :: Stroynadzor.info")
                
                Button(action: {
                    isSopramentViewShown = false
                }, label: {
                    Text("Ok.")
                })
            }.padding()
        }
        .frame(width: 300, height: 500, alignment: .center)
    }
}


