//
//  SourceOfTruth.swift
//  SopramentApp
//
//  Created by Alexey Kirpichnikov on 2021/1/8.
//

import SwiftUI

class SourceOfTruth: ObservableObject {
    
    //MARK: - Buttons A-L & PopupViewOne:
    @Published var index: Int = 0
    @Published var isPopupViewOneShown = false
    
    //MARK: - Picture for the Image in BlockTwoView:
    @Published var isMaterialPictureShown = false
    @Published var imageName: String = ""
    @Published var materialTableName: String = ""
    
    //MARK:- Table in PopupViewTwo:
    @Published var isImageTapped = false
    @Published var itemsNameArray = [MaterialItem]()
    @Published var itemName: String = ""
    
    //MARK:- Item entities:
    @Published var isItemPicked = false
    @Published var itemTitle: String = ""
    @Published var itemGost: String = ""
    @Published var itemCertificate: String = ""
    @Published var itemKilo: Double = 0.0
    @Published var itemMeter2: Double = 0.0
    @Published var itemLabel: String = ""
    @Published var itemKg: String = ""
    @Published var itemMt: String = ""
    @Published var itemM2: String = ""
    
    //MARK:- BlockTwoView:
    @Published var mtFigure: Int = 0
    @Published var kgFigure: Int = 0
    @Published var meter2figure: Int = 0
    
    //MARK:- CalculatedView:
    @Published var isCalcualtorPopupShown = false
    @Published var inputValue: Int = 0
    @Published var quantityValue: Double = 0.0
    @Published var kilogramValue: Double = 0.0
    
    func setPicture() -> Image {
        switch imageName {
        case "iv_d1":
            print("SourceOfTruth. setPicture(). imageName = \(imageName).")
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
            print("SourceOfTruth. setPicture(). imageName = nil.")
            return Image(systemName: "questionmark.circle")
        }
    }
    
    func makeMaterialButtonView() -> AnyView {
        switch index {
        case 1:
            print("SourceOfTruth. makeMaterialButtonView(). A.")
            return AnyView(MaterialButtonViewA().environmentObject(self))
        case 2:
            print("SourceOfTruth. makeMaterialButtonView(). B.")
            return AnyView(MaterialButtonViewB().environmentObject(self))
        case 3:
            print("SourceOfTruth. makeMaterialButtonView(). C.")
            return AnyView(MaterialButtonViewC().environmentObject(self))
        case 4:
            print("SourceOfTruth. makeMaterialButtonView(). D.")
            return AnyView(MaterialButtonViewA().environmentObject(self))
        case 5:
            print("SourceOfTruth. makeMaterialButtonView(). E.")
            return AnyView(MaterialButtonViewA().environmentObject(self))
        case 6:
            print("SourceOfTruth. makeMaterialButtonView(). F.")
            return AnyView(MaterialButtonViewA().environmentObject(self))
        case 7:
            print("SourceOfTruth. makeMaterialButtonView(). G.")
            return AnyView(MaterialButtonViewA().environmentObject(self))
        case 8:
            print("SourceOfTruth. makeMaterialButtonView(). H.")
            return AnyView(MaterialButtonViewA().environmentObject(self))
        case 9:
            print("SourceOfTruth. makeMaterialButtonView(). I.")
            return AnyView(MaterialButtonViewA().environmentObject(self))
        case 10:
            print("SourceOfTruth. makeMaterialButtonView(). J.")
            return AnyView(MaterialButtonViewA().environmentObject(self))
        case 11:
            print("SourceOfTruth. makeMaterialButtonView(). K.")
            return AnyView(MaterialButtonViewA().environmentObject(self))
        case 12:
            print("SourceOfTruth. makeMaterialButtonView(). L.")
            return AnyView(MaterialButtonViewA().environmentObject(self))
        default:
            print("SourceOfTruth. makeMaterialButtonView(). M.")
            return AnyView(MaterialButtonViewA().environmentObject(self))
        }
    }
}

