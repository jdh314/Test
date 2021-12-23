//
//  HourlyRowView.swift
//  Test
//
//  Created by Jonathan Hogue on 12/10/21.
//

import SwiftUI

struct HourlyRowView: View {
    
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    
    var hourTime: String?
    var hourCode: Int?
    var hourTemp: Double?
    var hourDescription: String?
    
    var body: some View {
        
        if dynamicTypeSize > .xxLarge {
            VStack {
                HStack {
                    Text(checkAndReturnTime(timeToCheck:hourTime))
                        .padding(.leading, 15.0)
                        .padding(.trailing, 15.0)
                    Image(systemName: checkForEmptyImage(loadedImage: hourCode))
                        .padding(.trailing, 15)
                    Text("\(convertCurrentTemp(temp:hourTemp))°")
                    Spacer()
                }
                
                HStack {
                    Text(checkForEmptyWeatherText(loadedText:hourDescription))
                        .padding(.leading, 15.0)
                    Spacer()
                }
                Spacer()
                    .frame(height: 35.0)
            }
            
        } else {
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
}

struct HourlyRowView_Previews: PreviewProvider {
    static var previews: some View {
        HourlyRowView()
    }
}
