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
                    
                    if truth.isCalculationDone == true {
                        HStack {
                            
                            Button {
                                print("ContentView. PRiSE button was tapped.")
                                truth.isToShowPrisePopup = true
                            } label : {
                                Text("PRiSE")
                                    .font(.title3)
                                    .fontWeight(.regular)
                                    .frame(width: 120, height: 30)
                                    .foregroundColor(.red)
                                    .background(Color.black)
                                    .cornerRadius(8)
                            }
                            
                            Button {
                                print("ContentView. SAVE button was tapped.")
                            } label : {
                                Text("SAVE")
                                    .font(.title3)
                                    .fontWeight(.regular)
                                    .frame(width: 120, height: 30)
                                    //.foregroundColor(truth.isCalculationDone ? .green : .white)
                                    .foregroundColor(.green)
                                    //.background(truth.isCalculationDone ? Color.black : Color.white)
                                    .background(Color.black)
                                    .cornerRadius(8)
                            }
                            
                            Button {
                                print("ContentView. PRiNT button was tapped.")
                            } label : {
                                Text("PRiNT")
                                    .font(.title3)
                                    .fontWeight(.regular)
                                    .frame(width: 120, height: 30)
                                    //.foregroundColor(truth.isCalculationDone ? .gray : .white)
                                    .foregroundColor(.gray)
                                    //.background(truth.isCalculationDone ? Color.black : Color.white)
                                    .background(Color.black)
                                    .cornerRadius(8)
                            }
                        }
                    }
                    
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
                    //.background(Color.yellow)
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
                CalculatorPopup()
            }

            if truth.isToShowPrisePopup {
                PrisePopup()
            }
        }
    }
}
