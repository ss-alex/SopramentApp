//
//  ButtonAPopUpView.swift
//  SopramentApp
//
//  Created by Alexey Kirpichnikov on 2020/12/23.
//

import SwiftUI

struct MaterialPopupView: View {
    @EnvironmentObject var truth: SourceOfTruth
    
    var body: some View {
        ZStack {
            truth.makeView()
        }
    }
}

class SourceOfTruth: ObservableObject {
    
    @Published var isMaterialShown = false
    
    @Published var index: Int = 0
    
    @Published var isMaterialPictureShown = false
    
    @Published var imageName: String = ""
    
    func setPicture() -> Image {
        switch imageName {
        case "iv_d1":
            print("SourceOfTruth. setPicture(). iv_d1")
            //return Image("pdficon2")
            return Image(systemName: "scribble")
        case "iv_d2":
            print("SourceOfTruth. setPicture(). iv_d2")
            return Image("iv_d1")
        case "iv_d3":
            print("SourceOfTruth. setPicture(). iv_d3")
            return Image("iv_d1")
        case "iv_d4":
            print("SourceOfTruth. setPicture(). iv_d4")
            return Image("iv_d1")
        case "iv_d5":
            print("SourceOfTruth. setPicture(). iv_d5")
            return Image("iv_d1")
        case "iv_d6":
            print("SourceOfTruth. setPicture(). iv_d6")
            return Image("iv_d1")
        default:
            print("SourceOfTruth. setPicture(). dedault value = empty string")
            return Image(systemName: "pencil")
        }
    }
    
    func makeView() -> AnyView {
        
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

/*class MaterialViewModel: ObservableObject {
    @Published var index: Int = 0
    
    func makeView() -> AnyView {
        switch index {
        case 0:
            print("lala")
            return AnyView(MaterialButtonViewA().environmentObject(self))
        default:
            print("lalala")
            return AnyView(MaterialButtonViewA().environmentObject(self))
        }
    }
}*/

/*struct MaterialPopupView: View {
    
    @Binding var isMaterialPopupShown: Bool
    
    var index = 0 /// @State private ???
    //@ObservedObject var MaterialPopup: MaterialPopup
    //@ObservedObject var materialViewModel: MaterialPopupViewModel
    
    @StateObject var popupShown: MaterialPopup
    
    var body: some View {
        ZStack {
            //materialViewModel.makeView()
            //materialViewModel.makeView(index: self.index)
            makeView(index: index)
        }
    }
    
    func makeView(index: Int) -> AnyView {
        switch index {
        case 1:
            print("ContentView. buttonIndex = 1")
            /*return AnyView(MaterialButtonViewA(isMaterialPopupShown: $MaterialPopup.isMaterialPopupShown).environmentObject(self))*/
        
        //return AnyView(MaterialButtonViewA(popupShown: $popupShown))
        default:
            print("")
            /*return AnyView(MaterialButtonViewA(isMaterialPopupShown: $MaterialPopup.isMaterialPopupShown).environmentObject(self))*/
        }
    }
}

final class MaterialPopup: ObservableObject {
    @Published var isMaterialPopupShown = false
}

/*final class MaterialPopupViewModel: ObservableObject {
    
    @EnvironmentObject var MaterialPopup: MaterialPopup
    
    /*func makeView(index: Int) -> AnyView {
        switch index {
        case 1:
            print("ContentView. buttonIndex = 1")
            return AnyView(MaterialButtonViewA(isMaterialPopupShown: $MaterialPopup.isMaterialPopupShown).environmentObject(self))
        default:
            print("")
            return AnyView(MaterialButtonViewA(isMaterialPopupShown: $MaterialPopup.isMaterialPopupShown).environmentObject(self))
        }
    }*/
}*/


/*if self.index == 0 {
    print("index = 0 case was realized")
    return AnyView(MaterialButtonViewC().environmentObject(self))
} else if self.index == 1 {
    print("index = 1 case was realized")
    return AnyView(MaterialButtonViewA().environmentObject(self))
} else {
    print("everything-else case was realized")
    return AnyView(MaterialButtonViewB().environmentObject(self))
}*/


/*case 2:
    print("ContentView. buttonIndex = 2")
    return AnyView(MaterialButtonViewA().environmentObject(self))
case 3:
    print("ContentView. buttonIndex = 3")
    return AnyView(MaterialButtonViewA().environmentObject(self))
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
    return AnyView(MaterialButtonViewA().environmentObject(self))*/
 
 */


//@Binding var isMaterialPopupShown: Bool
//@ObservedObject var model: MaterialViewModel

//@EnvironmentObject var truth: SourceOfTruth

//@StateObject var truth = SourceOfTruth()

/*let binding = Binding(get: {[weak self] in self?.isMaterialShown ?? false}, set: {[weak self] in self?.isMaterialShown = $0})*/
