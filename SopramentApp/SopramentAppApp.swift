//
//  SopramentAppApp.swift
//  SopramentApp
//
//  Created by Лена Мырленко on 2020/12/16.
//

import SwiftUI

@main
struct SopramentAppApp: App {
    var settings = SourceOfTruth()
    var body: some Scene {
        WindowGroup {
            //ContentView()
            ContentView().environmentObject(settings)
        }
    }
}
