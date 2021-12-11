//
//  TestApp.swift
//  Test
//
//  Created by Jonathan Hogue on 10/30/21.
//

import SwiftUI

@main
struct TestApp: App {
    
    var weatherModelData = ContentViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(weatherModelData)
        }
    }
}
