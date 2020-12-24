//
//  RemarksView.swift
//  SopramentApp
//
//  Created by Alexey Kirpichnikov on 2020/12/22.
//

import SwiftUI

struct RemarksView: View {
    
    @Binding var isRemarksViewShown: Bool
    
    var body: some View {
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
                    isRemarksViewShown = false
                }, label: {
                    Text("Ok.")
                })
            }
            .padding()
        }
        .frame(width: 300, height: 500, alignment: .center)
    }
}

