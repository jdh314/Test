//
//  SwiftUIView.swift
//  Test
//
//  Created by Jonathan Hogue on 11/24/21.
//

import SwiftUI

struct WeekDayWeather: View {

    var dayOfTheWeek: String?
    var forecastedWeather: Int?
    var temp: Double?

    var body: some View {
        ZStack {
            VStack(spacing: 8){
                Text(isDayOfWeekEmpty(date:dayOfTheWeek))
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .medium))
                Image(systemName: checkForEmptyImage(loadedImage: forecastedWeather))
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                Text("\(convertCurrentTemp(temp:temp))°")
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(.white)
            }
        }
    }
}

struct WeekDayWeather_Previews: PreviewProvider {
    static var previews: some View {
        WeekDayWeather(dayOfTheWeek: "Tue", forecastedWeather: 1000, temp: 89)
    }
}
