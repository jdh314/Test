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
                .frame(width: 45.0)
            Text(checkAndReturnTime(timeToCheck:hourTime))
                .padding(.trailing, 25)
            Image(systemName: checkForEmptyImage(loadedImage: hourCode))
                .padding(.trailing, 25)
            Text("\(convertCurrentTemp(temp:hourTemp))°")
                .padding(.trailing, 25)
            Text(checkForEmptyWeatherText(loadedText:hourDescription))
            Spacer()
        }
        .padding(.bottom, 50)
        .frame(alignment: .leading)
    }
}

struct HourlyRowView_Previews: PreviewProvider {
    static var previews: some View {
        HourlyRowView()
    }
}
