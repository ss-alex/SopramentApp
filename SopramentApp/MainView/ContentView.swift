//
//  ContentView.swift
//  SopramentApp
//
//  Created by Alexey Kirpichnikov on 2020/12/16.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showRemarks = false
    @State private var showSortamentInfo = false
    
    var body: some View {
        
        ZStack {
            NavigationView {
                VStack {
                    BlockOneView()
                    Spacer()
                    ButtonsVStack().background(Color.yellow)
                }
                
                .navigationBarItems(leading:
                                    
                                        Button(action: {
                                            print("ContentView. 'REMARKS' Button was tapped.")
                                            showRemarks = true
                                            print("showRemarks is equal \(showRemarks)")
                                        }, label: {
                                            Text("REMARKS")
                                        })
                                    
                                    ,trailing:
                                    
                                        Button(action: {
                                            print("ContentView. 'ГОСТ Сортамент' Button was tapped.")
                                            showSortamentInfo = true
                                            print("showRemarks is equal \(showSortamentInfo)")
                                        }, label: {
                                            Text("ГОСТ Сортамент")
                                        })
                )
            }

            if $showRemarks.wrappedValue {
                ZStack {
                    Color.gray
                    VStack {
                        Text("// используемые в приложении и оговоренные нормативной документацией")
                        Spacer()
                        Text("::ПРИМЕЧАНИЯ::")
                        Spacer()
                        Text("* изготавляются по договоренности")
                        Spacer()
                        Text("** при новом проектировании не применять")
                        Spacer()
                        Text("(...) при новом проектировании не применять")
                        
                        Button(action: {
                            showRemarks = false
                        }, label: {
                            Text("Ok.")
                        })
                    }
                    .padding()
                }
                .frame(width: 300, height: 500, alignment: .center)
            }
            
            if $showSortamentInfo.wrappedValue {
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
                            showSortamentInfo = false
                        }, label: {
                            Text("Ok.")
                        })
                    }.padding()
                }
                .frame(width: 300, height: 500, alignment: .center)
            }
        }
    }
}

