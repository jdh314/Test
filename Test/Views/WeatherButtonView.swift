//
//  WeatherButtonView.swift
//  Test
//
//  Created by Jonathan Hogue on 11/1/21.
//

import Foundation
import SwiftUI

struct WeatherButtonView: View {
    
    var buttonTitle: String
    var backgroundColor: Color
    var foregroundColor: Color
    
    var body: some View {
        
        Text(buttonTitle)
            .frame(width: 280, height: 50)
            .font(.system(size: 25, weight: .medium))
            .background(backgroundColor)
            .foregroundColor(foregroundColor)
            .cornerRadius(10)
        }
    }
