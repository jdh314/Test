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
    var dynamicTypeSize: DynamicTypeSize
    
    
    var body: some View {
        
        Image(systemName: checkForEmptyImage(loadedImage: currentWeatherImage))
            .resizable()
            .renderingMode(.original)
            .aspectRatio(contentMode: .fit)
            .frame(width: 130, height: 130)
        
        
        if dynamicTypeSize >= .accessibility2 {
            Text(checkForEmptyWeatherText(loadedText: currentWeatherText))
                .font(.system(size: 60, weight: .medium))
        } else {
            Text(checkForEmptyWeatherText(loadedText: currentWeatherText))
                .font(.system(size: 35, weight: .medium))
        }
        
        Text("\(convertCurrentTemp(temp:currentTemp))°")
            .font(.system(size: 70, weight: .medium))
            .padding(.bottom, 20)
        
    }
}

struct CurrentWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeatherView(dynamicTypeSize: .medium)
    }
}
