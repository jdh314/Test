//
//  ContentView.swift
//  Test
//
//  Created by Jonathan Hogue on 10/30/21.
//

import SwiftUI

struct ContentView: View {

    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    @Environment(\.colorScheme) var colorScheme
    @StateObject var weatherModelData = ContentViewModel()
    @State private var isNight = false
    @State private var topColorDay: Color = Color("topGradient")
    @State private var topColorNight: Color = .pink
    @State private var bottomColorDay: Color = Color("bottomGradient")
    @State private var bottomColorNight: Color = .orange
    @State private var presentHourlyView = false
        
    var body: some View {
        
        
        ZStack{
            
            BackgroundView(isNight: isNight, topColorDay: topColorDay, topColorNight: topColorNight, bottomColorDay: bottomColorDay, bottomColorNight: bottomColorNight)

            
            if weatherModelData.responseWeatherData == nil {
                ProgressView(value: weatherModelData.loadingProgress)
                    .frame(width: 400.0)
            } else {
                VStack{
                    CityView(cityName: weatherModelData.responseWeatherData?.location.name, dynamicTypeSize: dynamicTypeSize)
                    
                    Spacer()
                    
                    CurrentWeatherView(currentTemp: weatherModelData.responseWeatherData?.current.temp_f,
                                       currentWeatherImage: isNight ? weatherModelData.responseWeatherData?.current.condition.code : weatherModelData.responseWeatherData?.current.condition.code,
                                       currentWeatherText: weatherModelData.responseWeatherData?.current.condition.text, dynamicTypeSize: dynamicTypeSize)
                    
                    HStack(spacing: 40) {
                        
                        VStack {
                            WeekDayWeather(dayOfTheWeek: weatherModelData.responseWeatherData?.forecast.forecastday[0].date,
                                           forecastedWeather: weatherModelData.responseWeatherData?.forecast.forecastday[0].day.condition.code,
                                           temp: weatherModelData.responseWeatherData?.forecast.forecastday[0].day.maxtemp_f)
                        }
                        VStack {
                            WeekDayWeather(dayOfTheWeek: weatherModelData.responseWeatherData?.forecast.forecastday[1].date,
                                           forecastedWeather: weatherModelData.responseWeatherData?.forecast.forecastday[1].day.condition.code,
                                           temp: weatherModelData.responseWeatherData?.forecast.forecastday[1].day.maxtemp_f)
                        }
                        VStack {
                            WeekDayWeather(dayOfTheWeek: weatherModelData.responseWeatherData?.forecast.forecastday[2].date,
                                           forecastedWeather: weatherModelData.responseWeatherData?.forecast.forecastday[2].day.condition.code,
                                           temp: weatherModelData.responseWeatherData?.forecast.forecastday[2].day.maxtemp_f)
                        }
                        
                    }
                        
                    Spacer()
                    
                    Button {
                        presentHourlyView.toggle()
                    } label: {
                        WeatherButtonView(buttonTitle: "Hourly Details",
                                      backgroundColor: isNight ? Color("buttonBackground"): Color("buttonBackground"),
                                          foregroundColor: .black)
                    }
                    .sheet(isPresented: $presentHourlyView) {
                        HourlyView(weatherModelData: weatherModelData, isNight: $isNight, topColorDay: $topColorDay, topColorNight: $topColorNight, bottomColorDay: $bottomColorDay, bottomColorNight: $bottomColorNight, isPresented: $presentHourlyView)

                    }

                    Spacer()
                    if dynamicTypeSize >= .accessibility2 {
                        Text("WeatherAPI.com")
                    } else {
                        Text("Data from WeatherAPI.com")
                    }
                    
                }
            }
            
            
        }
        .environmentObject(weatherModelData)
        .onAppear(perform: weatherModelData.checkIfServicesAreEnabled)
    }
}
