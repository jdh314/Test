//
//  BackgroundView.swift
//  Test
//
//  Created by Jonathan Hogue on 11/24/21.
//

import SwiftUI

struct BackgroundView: View {
    
    var topColor: Color
    var bottomeColor: Color
    
    var body: some View {
        LinearGradient(colors: [topColor, bottomeColor],
                       startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}


