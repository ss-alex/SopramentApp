//
//  ButtonAPopUpView.swift
//  SopramentApp
//
//  Created by Alexey Kirpichnikov on 2020/12/23.
//

import SwiftUI

struct MaterialPopupView: View {
    
    @Binding var isMaterialPopupShown: Bool
    
    @ObservedObject var materialViewModel: MaterialPopupViewModel
    
    var body: some View {
        ZStack {
            materialViewModel.makeView()
        }
    }
}



final class MaterialPopupViewModel: ObservableObject {
    @Published var index = 0
    
    func makeView() -> AnyView {
        if self.index == 0 {
            print("index = 0 case was realized")
            return AnyView(MaterialButtonViewC().environmentObject(self))
        } else if self.index == 1 {
            print("index = 1 case was realized")
            return AnyView(MaterialButtonViewA().environmentObject(self))
        } else {
            print("everything-else case was realized")
            return AnyView(MaterialButtonViewB().environmentObject(self))
        }
    }
}
