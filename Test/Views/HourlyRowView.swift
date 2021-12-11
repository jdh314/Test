//
//  HourlyRowView.swift
//  Test
//
//  Created by Jonathan Hogue on 12/10/21.
//

import SwiftUI

struct HourlyRowView: View {
    
    var hourTime: String?
    var hourCode: Int?
    var hourTemp: Double?
    var hourDescription: String?
    
    var body: some View {
        
        HStack{
            Spacer()
            Text(checkAndReturnTime(timeToCheck:hourTime))
            Spacer()
            Image(systemName: checkForEmptyImage(loadedImage: hourCode))
            Spacer()
            Text("\(convertCurrentTemp(temp:hourTemp))°")
            Spacer()
            Text(checkForEmptyWeatherText(loadedText:hourDescription))
        }
        .padding()
    }
}

struct HourlyRowView_Previews: PreviewProvider {
    static var previews: some View {
        HourlyRowView()
    }
}
