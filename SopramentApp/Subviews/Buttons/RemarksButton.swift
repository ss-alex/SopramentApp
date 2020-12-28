//
//  remarksButton.swift
//  SopramentApp
//
//  Created by Alexey Kirpichnikov on 2020/12/22.
//

import SwiftUI

struct RemarksButton: View {
    
    @Binding var isRemarksViewShown: Bool
    
    var body: some View {
        Button(action: {
            print("RemarksButton. 'REMARKS' Button was tapped.")
            isRemarksViewShown = true
            print("showRemarks is equal \(isRemarksViewShown)")
        }, label: {
            Text("REMARKS")
        })
    }
}


