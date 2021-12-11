//
//  CurrentWeatherView.swift
//  Test
//
//  Created by Jonathan Hogue on 11/24/21.
//

import SwiftUI

struct CurrentWeatherView: View {

    var currentTemp: Double?
    var currentWeatherImage: Int?
    var currentWeatherText: String?
    
    
    var body: some View {
        Image(systemName: checkForEmptyImage(loadedImage: currentWeatherImage))
            .resizable()
            .renderingMode(.original)
            .aspectRatio(contentMode: .fit)
            .frame(width: 180, height: 180)
        
        Text(checkForEmptyWeatherText(loadedText: currentWeatherText))
            .font(.system(size: 35, weight: .medium))
            .foregroundColor(.white)
        
        Text("\(convertCurrentTemp(temp:currentTemp))°")
            .font(.system(size: 70, weight: .medium))
            .foregroundColor(.white)
            .padding(.bottom, 50)
    }
}

struct CurrentWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeatherView()
    }
}