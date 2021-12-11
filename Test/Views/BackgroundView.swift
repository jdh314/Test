//
//  BackgroundView.swift
//  Test
//
//  Created by Jonathan Hogue on 11/24/21.
//

import SwiftUI

struct BackgroundView: View {
    
    var isNight: Bool
    
    var topColorDay: Color
    var topColorNight: Color
    
    var bottomColorDay: Color
    var bottomColorNight: Color
    
    var body: some View {
        LinearGradient(colors: [isNight ? topColorNight: topColorDay, isNight  ? bottomColorNight: bottomColorDay],
                       startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}


