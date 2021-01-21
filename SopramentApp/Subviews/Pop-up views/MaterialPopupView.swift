//
//  ButtonAPopUpView.swift
//  SopramentApp
//
//  Created by Alexey Kirpichnikov on 2020/12/23.
//

import SwiftUI

struct MaterialPopupView: View {
    @EnvironmentObject var truth: SourceOfTruth
    
    var body: some View {
        ZStack {
            truth.makeMaterialButtonView()
        }
    }
}
