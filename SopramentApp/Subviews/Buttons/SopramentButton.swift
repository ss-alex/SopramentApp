//
//  SopramentButton.swift
//  SopramentApp
//
//  Created by Alexey Kirpichnikov on 2020/12/22.
//

import SwiftUI

struct SopramentButton: View {
    
    @Binding var isSopramentViewShown: Bool
    
    var body: some View {
        Button(action: {
            print("SopramentButton. 'ГОСТ Сортамент' Button was tapped.")
            isSopramentViewShown = true
            print("showRemarks is equal \(isSopramentViewShown)")
        }, label: {
            Text("ГОСТ Сортамент")
        })
    }
}


