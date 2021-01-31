//
//  BlockOneView.swift
//  SopramentApp
//
//  Created by Alexey Kirpichnikov on 2020/12/19.
//

import SwiftUI

/*extension Double {
    func round(to places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}*/

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
    
    var body: some View {
        HStack(spacing: 0) {
            Text(isItemPicked ? "\(itemGost)" : "")
                .frame(width: 80, height: 40)
                //.background(Color.orange)
            
            Text(isItemPicked ? "\(itemCertificate)" : "")
                .frame(width: 160, height: 40, alignment: .leading)
                //.background(Color.green)
        }
        //.background(Color.gray)
    }
}

