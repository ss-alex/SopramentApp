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

    //@StateObject var truth = SourceOfTruth()
    //@State private var isMaterialPopupShown = false
    
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
                                //isMaterialPopupShown = true
                                //truth.isMaterialShown = isMaterialPopupShown
                                truth.index = 1
                                truth.isMaterialShown = true
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
                                truth.isMaterialShown = true
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
                                truth.isMaterialShown = true
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
            
            
            ///как сделать так, чтобы отсматривалось изменение в stateobject и popupView пропадал бы
            
            if truth.isMaterialShown {
                MaterialPopupView()
            }
        }
    }
}

/*enum Index: Int {
    case one = 1
    case two = 2
    case three = 3
    case four = 4
    case five = 5
    case six = 6
    case seven = 7
    case eight = 8
    case nine = 9
    case ten = 10
    case eleven = 11
    case twelve = 12
}*/


/*if var buttonIndex = materialButtonIndex {
    switch self {
    case 0: print("ContentView. No button was tapped")
    case 1: print("ContentView. buttonIndex = 1")
    case 2: print("ContentView. buttonIndex = 2")
    case 3: print("ContentView. buttonIndex = 3")
    case 4: print("ContentView. buttonIndex = 4")
    case 5: print("ContentView. buttonIndex = 5")
    case 6: print("ContentView. buttonIndex = 6")
    case 7: print("ContentView. buttonIndex = 7")
    case 8: print("ContentView. buttonIndex = 8")
    case 9: print("ContentView. buttonIndex = 9")
    case 10: print("ContentView. buttonIndex = 10")
    case 11: print("ContentView. buttonIndex = 11")
    case 12: print("ContentView. buttonIndex = 12")
    }
} else {
    print("Index equal to 0")
}*/


//var buttonIndex = materialButtonIndex

/*switch buttonIndex {
case 0: print("ContentView. No button was tapped")
case 1: print("ContentView. buttonIndex = 1")
case 2: print("ContentView. buttonIndex = 2")
case 3: print("ContentView. buttonIndex = 3")
case 4: print("ContentView. buttonIndex = 4")
case 5: print("ContentView. buttonIndex = 5")
case 6: print("ContentView. buttonIndex = 6")
case 7: print("ContentView. buttonIndex = 7")
case 8: print("ContentView. buttonIndex = 8")
case 9: print("ContentView. buttonIndex = 9")
case 10: print("ContentView. buttonIndex = 10")
case 11: print("ContentView. buttonIndex = 11")
case 12: print("ContentView. buttonIndex = 12")
}*/

/*if buttonIndex = 0 {
    print("ContentView. No button was tapped")
} else if buttonIndex = 1 {
    print("ContentView. buttonIndex = 1")
} else {
    print("ContentView. buttonIndex = 12")
}*/


/*if $isMaterialPopupShown.wrappedValue {
    MaterialPopupView(isMaterialPopupShown: $isMaterialPopupShown, materialViewModel: model)
}*/

/*if $isMaterialPopupShown.wrappedValue {
    MaterialPopupView(isMaterialPopupShown: $isMaterialPopupShown, index: index, materialViewModel: model)
}*/


/*if $isMaterialPopupShown.wrappedValue {
    MaterialPopupView(materialViewModel: model)
}*/
