//
//  ContentView.swift
//  Test
//
//  Created by Jonathan Hogue on 10/30/21.
//

import SwiftUI

struct ContentView: View {

    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    
    @StateObject var weatherModelData = ContentViewModel()
    @State private var isNight = false
    @State private var topColorDay: Color = .blue
    @State private var topColorNight: Color = .pink
    @State private var bottomColorDay: Color = Color("lightBlue")
    @State private var bottomColorNight: Color = .orange
    @State private var presentHourlyView = false
    @State var scrollToValue: Int?
        
    var body: some View {
        
        
        ZStack{
            BackgroundView(isNight: isNight, topColorDay: topColorDay, topColorNight: topColorNight, bottomColorDay: bottomColorDay, bottomColorNight: bottomColorNight)

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
                    isNight.toggle()
                    presentHourlyView.toggle()
                } label: {
                    WeatherButtonView(buttonTitle: "Hourly Details",
                                  backgroundColor: isNight ? Color("myMint"): .white,
                                  foregroundColor: isNight ? .white: .blue)
                }
                .sheet(isPresented: $presentHourlyView) {
                    HourlyView(weatherModelData: weatherModelData, isNight: $isNight, topColorDay: $topColorDay, topColorNight: $topColorNight, bottomColorDay: $bottomColorDay, bottomColorNight: $bottomColorNight, isPresented: $presentHourlyView)

                }

                Spacer()
                
            }
        }
        .environmentObject(weatherModelData)
        .onAppear(perform: weatherModelData.checkIfServicesAreEnabled)
    }
}
