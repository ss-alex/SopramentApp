//
//  BlockOneView.swift
//  SopramentApp
//
//  Created by Alexey Kirpichnikov on 2020/12/19.
//

import SwiftUI
//import PDFViewer
import WebKit

extension Double {
    var roundedInTwo:String {
        return String(format: "%.2f", self)
    }
}

struct ItemDataView: View {
    @EnvironmentObject var truth: SourceOfTruth
    
    var body: some View {
        VStack {
            HStackOne(isItemPicked: truth.isItemPicked,
                      itemName: truth.itemName)
            
            HStackTwo(isItemPicked: truth.isItemPicked,
                      itemKilo: truth.itemKilo,
                      itemMeter2: truth.itemMeter2)
            
            HStackThree(isItemPicked: truth.isItemPicked,
                        itemGost: truth.itemGost,
                        itemCertificate: truth.itemCertificate)
        }
    }
}

struct HStackOne: View {
    var isItemPicked: Bool
    var itemName: String
    
    var body: some View {
        HStack {
            Text(isItemPicked ? "\(itemName)" : "")
                .frame(width: 240, height: 40)
                //.background(Color.yellow)
        }
    }
}

struct HStackTwo: View {
    var isItemPicked: Bool
    var itemKilo: Double
    var itemMeter2: Double
    
    var body: some View {
        HStack {
            Text(isItemPicked ? "1 мп:" : "")
            Text(isItemPicked ? "кг:" : "")
            Text(isItemPicked ? "\(itemKilo.roundedInTwo)" : "")
                .foregroundColor(.blue)
            Text(isItemPicked ? "m2" : "")
            Text(isItemPicked ? "\(itemMeter2.roundedInTwo)" : "")
                .foregroundColor(.blue)
        }
        .frame(width: 240, height: 40)
        //.background(Color.blue)
    }
}

struct HStackThree: View {
   
    
    var isItemPicked: Bool
    var itemGost: String
    var itemCertificate: String
    
    @State private var viewLocalPDF = false
    let pdfName = "sample"
    
    var body: some View {
        HStack(spacing: 0) {
            
            NavigationLink(destination: PDFView(), isActive: $viewLocalPDF) {
                Text(isItemPicked ? "\(itemGost)" : "")
                    .frame(width: 80, height: 40)
                    .onTapGesture {
                        viewLocalPDF = true
                    }
                    //.background(Color.orange)
            }
            
            Text(isItemPicked ? "\(itemCertificate)" : "")
                .frame(width: 160, height: 40, alignment: .leading)
        }
    }
    
    func PDFView() -> WebView {
        return WebView(request: openPDF())
    }
    
    func openPDF() -> URLRequest {
        let path = Bundle.main.path(forResource: "sample", ofType: "pdf")
        let url = URL(fileURLWithPath: path!)
        return URLRequest(url: url)
    }
    
}

struct WebView: UIViewRepresentable {
    let request: URLRequest
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(request)
    }
}


