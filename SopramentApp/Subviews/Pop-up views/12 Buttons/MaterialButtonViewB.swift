//
//  MaterialButtonViewB.swift
//  SopramentApp
//
//  Created by Лена Мырленко on 2020/12/24.
//

import SwiftUI

struct MaterialButtonViewB: View {
    //@StateObject var truth = SourceOfTruth()
    @EnvironmentObject var truth: SourceOfTruth
    
    private let iBar = ["- joist (J)",
                        "- broad-flange (H)",
                        "- column (UC)",
                        "- additional joist (A-J)",
                        "- additional column (A-UC)",
                        "- pile-supported (PS)",
                        "- joist (JT)",
                        "- broad-flange (HT)",
                        "- column (CT)"]
    
    private let tBar = ["- joist (JT)",
                        "- broad-flange (HT)",
                        "column (CT)"]
    
    var body: some View {
        ZStack {
            
            VStack {
                List {
                    Section(header: Text("I-bar")) {
                        ForEach(0 ..< iBar.count) {
                            Text(self.iBar[$0])
                        }
                    }
                    
                    Section(header: Text("T-bar")) {
                        ForEach(0 ..< tBar.count) {
                            Text(self.tBar[$0])
                        }
                    }
                }
                
                Button {
                    truth.isMaterialShown = false
                    print("MaterialButtonViewB. Ok button was tapped.")
                    
                } label: {
                    Text("BBB")
                }

            }
        }
        .background(Color.white)
        .frame(width: 300, height: 500, alignment: .center)
    }
}


