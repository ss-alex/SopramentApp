//
//  BlockOneView.swift
//  SopramentApp
//
//  Created by Alexey Kirpichnikov on 2020/12/19.
//

import SwiftUI

struct BlockOneView: View {
    @EnvironmentObject var truth: SourceOfTruth
    
    var body: some View {
        VStack {
            HStackOne(isItemPicked: truth.isItemPicked, itemName: truth.itemName)
            HStackFour(isItemPicked: truth.isItemPicked)
        }
    }
}

struct HStackOne: View {
    var isItemPicked: Bool
    var itemName: String
    
    var body: some View {
        HStack {
            Spacer()
            
            Text(isItemPicked ? "\(itemName)" : "")
                .frame(width: 240, height: 40)
                .background(Color.yellow)
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
                .background(Color.orange)
            
            Text(isItemPicked ? "кг:" : "")
                .background(Color.green)
            
            Text(isItemPicked ? "\(itemKilo)" : "")
                .background(Color.orange)
            
            Text(isItemPicked ? "m2" : "")
                .background(Color.green)
            
            Text(isItemPicked ? "\(itemMeter2)" : "")
                .background(Color.orange)
        }
        .frame(width: 240, height: 40)
        .background(Color.blue)
    }
}

struct HStackThree: View {
    var isItemPicked: Bool
    var itemGost: String
    var itemCertificate: String
    
    var body: some View {
        HStack {
            Text(isItemPicked ? "\(itemGost)" : "")
                .frame(width: 80, height: 40)
                .background(Color.orange)
            
            Text(isItemPicked ? "\(itemCertificate)" : "")
                .frame(width: 160, height: 40, alignment: .leading)
                .background(Color.green)
        }
        .background(Color.gray)
    }
}

struct VStackOne: View {
    @EnvironmentObject var truth: SourceOfTruth
    
    var body: some View {
        VStack {
            HStackTwo(isItemPicked: truth.isItemPicked,
                      itemKilo: truth.itemKilo,
                      itemMeter2: truth.itemMeter2)
            
            HStackThree(isItemPicked: truth.isItemPicked,
                        itemGost: truth.itemGost,
                        itemCertificate: truth.itemCertificate)
        }
    }
}

struct HStackFour: View {
    var isItemPicked: Bool
    
    var body: some View {
        HStack {
            Image(systemName: isItemPicked ? "doc.on.doc" : "xmark.bin.circle.fill")
                .frame(width: 80, height: 80,alignment: .center)
                .background(Color.pink)
            
            VStackOne()
        }
    }
}


