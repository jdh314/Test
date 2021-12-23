//
//  HourlyView.swift
//  Test
//
//  Created by Jonathan Hogue on 12/10/21.
//

import SwiftUI

struct HourlyView: View {
    
    @ObservedObject var weatherModelData: ContentViewModel
    @Binding var isNight: Bool
    @Binding var topColorDay: Color
    @Binding var topColorNight: Color
    @Binding var bottomColorDay: Color
    @Binding var bottomColorNight: Color
    @Binding var isPresented: Bool
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight, topColorDay: topColorDay, topColorNight: topColorNight, bottomColorDay: bottomColorDay, bottomColorNight: bottomColorNight)
            
            VStack {
                
                HStack{
                    Spacer()
                    Button {
                        isPresented.toggle()
                    } label: {
                        Text("Close")
                            .fontWeight(.medium)
                    }
                    .foregroundColor(.white)
                    .padding(.trailing, 30)
                    .padding(.top, 30)
                    .buttonStyle(.bordered)
                    .buttonBorderShape(.roundedRectangle(radius: 10))
                }
                
                ScrollViewReader { (proxy: ScrollViewProxy) in
                    ScrollView {
                        ForEach(0..<3){ i in
                            HStack{
                                Spacer()
                                    .frame(maxWidth: 35.0)
                                Text(isDayOfWeekEmpty(date:weatherModelData.responseWeatherData?.forecast.forecastday[i].date))
                                    .padding()
                                    .font(.largeTitle)
                                Spacer()
                            }
                            ForEach(0..<24) { j in
                                HourlyRowView(hourTime: "\((weatherModelData.responseWeatherData?.forecast.forecastday[i].hour[j].time)!)",
                                              hourCode: weatherModelData.responseWeatherData?.forecast.forecastday[i].hour[j].condition.code,
                                              hourTemp: (weatherModelData.responseWeatherData?.forecast.forecastday[i].hour[j].temp_f)!,
                                              hourDescription: "\((weatherModelData.responseWeatherData?.forecast.forecastday[i].hour[j].condition.text)!)")
                            }
                            
                        }
                    }
                }
            }
        }
    }
}
