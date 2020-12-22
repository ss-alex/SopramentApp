//
//  ContentView.swift
//  SopramentApp
//
//  Created by Alexey Kirpichnikov on 2020/12/16.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isRemarksViewShown = false
    @State private var isSopramentViewShown = false
    
    var body: some View {
        
        ZStack {
            NavigationView {
                VStack {
                    BlockOneView()
                    Spacer()
                    BlockTwoHStackCombined()
                    Spacer()
                    ButtonsVStack().background(Color.yellow)
                }
                
                .navigationBarItems(leading: RemarksButton(isRemarksViewShown: $isRemarksViewShown),
                                    trailing: SopramentButton(isSopramentViewShown: $isSopramentViewShown)
                )
            }

            if $isRemarksViewShown.wrappedValue {
                RemarksView(isRemarksViewShown: $isRemarksViewShown)
            }
            
            if $isSopramentViewShown.wrappedValue {
                SopramentView(isSopramentViewShown: $isSopramentViewShown)
            }
        }
    }
}

