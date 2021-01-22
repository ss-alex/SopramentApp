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
                    BlockOneView()
                    Spacer()
                    
                    BlockTwoHStackCombined()
                    Spacer()
                    
                    VStack(spacing: 0) {
                        HStack(spacing: 20) {
                            Button {
                                truth.index = 1
                                truth.isMaterialButtonViewShown = true
                            } label: {
                                Text("A")
                                    .font(.title3)
                                    .fontWeight(.regular)
                                    .frame(width: 40, height: 30)
                                    .foregroundColor(.black)
                                    .background(Color.gray)
                                    .cornerRadius(8)
                            }
                            
                            Button {
                                truth.index = 2
                                truth.isMaterialButtonViewShown = true
                            } label: {
                                Text("B")
                                    .font(.title3)
                                    .fontWeight(.regular)
                                    .frame(width: 40, height: 30)
                                    .foregroundColor(.black)
                                    .background(Color.gray)
                                    .cornerRadius(8)
                            }
                            
                            Button {
                                truth.index = 3
                                truth.isMaterialButtonViewShown = true
                            } label: {
                                Text("C")
                                    .font(.title3)
                                    .fontWeight(.regular)
                                    .frame(width: 40, height: 30)
                                    .foregroundColor(.black)
                                    .background(Color.gray)
                                    .cornerRadius(8)
                            }
                            
                            Button {} label: {
                                Text("D")
                                    .font(.title3)
                                    .fontWeight(.regular)
                                    .frame(width: 40, height: 30)
                                    .foregroundColor(.black)
                                    .background(Color.gray)
                                    .cornerRadius(8)
                            }
                        }
                        .padding(20)
                        
                        HStack(spacing: 20) {
                            MaterialButton(letter: "E", index: 5)
                            MaterialButton(letter: "F", index: 6)
                            MaterialButton(letter: "G", index: 7)
                            MaterialButton(letter: "H", index: 8)
                        }
                        .padding(20)
                        
                        HStack(spacing: 20) {
                            MaterialButton(letter: "I", index: 9)
                            MaterialButton(letter: "J", index: 10)
                            MaterialButton(letter: "K", index: 11)
                            MaterialButton(letter: "L", index: 12)
                        }
                        .padding(20)
                    }
                    .background(Color.yellow)
                    .padding()
                    
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
            
            
            if truth.isMaterialButtonViewShown {
                PopupViewOne()
            }
        }
    }
}
