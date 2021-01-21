//
//  SourceOfTruth.swift
//  SopramentApp
//
//  Created by Alexey Kirpichnikov on 2021/1/8.
//

import SwiftUI

class SourceOfTruth: ObservableObject {
    
    //MARK: - Buttons A - M & MaterialButtonViews A - M.
    @Published var index: Int = 0
    @Published var isMaterialButtonViewShown = false
    
    //MARK: - Picture for the Image in BlockTwoView.
    @Published var isMaterialPictureShown = false
    @Published var imageName: String = ""
    @Published var materialTableName: String = ""
    
    //MARK:- Table in MaterialItemsPopupView.
    @Published var isImageTapped = false
    @Published var materialsNamesArray = [String]()
    
    func setPicture() -> Image {
        switch imageName {
        case "iv_d1":
            print("SourceOfTruth. setPicture(). iv_d1.")
            //return Image("pdficon2")
            return Image(systemName: "scribble")
        case "iv_d2":
            print("SourceOfTruth. setPicture(). iv_d2.")
            return Image("iv_d1")
        case "iv_d3":
            print("SourceOfTruth. setPicture(). iv_d3.")
            return Image("iv_d1")
        case "iv_d4":
            print("SourceOfTruth. setPicture(). iv_d4.")
            return Image("iv_d1")
        case "iv_d5":
            print("SourceOfTruth. setPicture(). iv_d5.")
            return Image("iv_d1")
        case "iv_d6":
            print("SourceOfTruth. setPicture(). iv_d6.")
            return Image("iv_d1")
        default:
            print("SourceOfTruth. setPicture(). dedault value = empty string")
            return Image(systemName: "pencil")
        }
    }
    
    func makeMaterialButtonView() -> AnyView {
        switch index {
        case 1:
            print("SourceOfTruth.lala")
            return AnyView(MaterialButtonViewA().environmentObject(self))
        case 2:
            print("ContentView. buttonIndex = 2")
            return AnyView(MaterialButtonViewB().environmentObject(self))
        case 3:
            print("ContentView. buttonIndex = 3")
            return AnyView(MaterialButtonViewC().environmentObject(self))
        case 4:
            print("ContentView. buttonIndex = 4")
            return AnyView(MaterialButtonViewA().environmentObject(self))
        case 5:
            print("ContentView. buttonIndex = 5")
            return AnyView(MaterialButtonViewA().environmentObject(self))
        case 6:
            print("ContentView. buttonIndex = 6")
            return AnyView(MaterialButtonViewA().environmentObject(self))
        case 7:
            print("ContentView. buttonIndex = 7")
            return AnyView(MaterialButtonViewA().environmentObject(self))
        case 8:
            print("ContentView. buttonIndex = 8")
            return AnyView(MaterialButtonViewA().environmentObject(self))
        case 9:
            print("ContentView. buttonIndex = 9")
            return AnyView(MaterialButtonViewA().environmentObject(self))
        case 10:
            print("ContentView. buttonIndex = 10")
            return AnyView(MaterialButtonViewA().environmentObject(self))
        case 11:
            print("ContentView. buttonIndex = 11")
            return AnyView(MaterialButtonViewA().environmentObject(self))
        case 12:
            print("ContentView. buttonIndex = 12")
            return AnyView(MaterialButtonViewA().environmentObject(self))
        default:
            print("SourceOfTruth. default value")
            return AnyView(MaterialButtonViewA().environmentObject(self))
        }
    }
}

