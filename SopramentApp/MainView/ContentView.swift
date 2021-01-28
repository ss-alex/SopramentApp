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
    
    @EnvironmentObject var truth: SourceOfTruth
    
    var body: some View {
        ZStack {
            NavigationView {
                VStack {
                    ItemDataView()
                    Spacer()
                    
                    ItemImagePlusCalculatorView()
                    Spacer()
                    
                    VStack(spacing: 0) {
                        
                        HStack(spacing: 20) {
                            MaterialButton(buttonIndex: 1, letter: "A")
                            MaterialButton(buttonIndex: 2, letter: "B")
                            MaterialButton(buttonIndex: 3, letter: "C")
                            MaterialButton(buttonIndex: 4, letter: "D")
                        }
                        .padding(20)
                        
                        HStack(spacing: 20) {
                            MaterialButton(buttonIndex: 5, letter: "E")
                            MaterialButton(buttonIndex: 6, letter: "F")
                            MaterialButton(buttonIndex: 7, letter: "G")
                            MaterialButton(buttonIndex: 8, letter: "H")
                        }
                        .padding(20)
                        
                        HStack(spacing: 20) {
                            MaterialButton(buttonIndex: 9, letter: "I")
                            MaterialButton(buttonIndex: 10, letter: "J")
                            MaterialButton(buttonIndex: 11, letter: "K")
                            MaterialButton(buttonIndex: 12, letter: "L")
                        }
                        .padding(20)
                    }
                    .background(Color.yellow)
                    .padding()
                    
                }
                .navigationBarItems(leading:
                                        RemarksButton(isRemarksViewShown: $isRemarksViewShown),
                                    trailing:
                                        SopramentButton(isSopramentViewShown: $isSopramentViewShown)
                )
                
            }

            if $isRemarksViewShown.wrappedValue {
                RemarksView(isRemarksViewShown: $isRemarksViewShown)
            }
            
            if $isSopramentViewShown.wrappedValue {
                SopramentView(isSopramentViewShown: $isSopramentViewShown)
            }
            
            if truth.isPopupViewOneShown {
                PopupViewOne()
            }
            
            if truth.isCalcualtorPopupShown {
                CalculatorPopupView()
            }
        }
    }
}
