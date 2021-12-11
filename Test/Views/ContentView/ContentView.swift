//
//  ContentView.swift
//  Test
//
//  Created by Jonathan Hogue on 10/30/21.
//

import SwiftUI

struct ContentView: View {

    @StateObject var weatherModelData = ContentViewModel()
    @State private var isNight = false
    @State private var topColorDay: Color = .blue
    @State private var topColorNight: Color = .pink
    @State private var bottomColorDay: Color = Color("lightBlue")
    @State private var bottomColorNight: Color = .orange
    @State private var presentHourlyView = false
        
    var body: some View {
        ZStack{
            BackgroundView(isNight: isNight, topColorDay: topColorDay, topColorNight: topColorNight, bottomColorDay: bottomColorDay, bottomColorNight: bottomColorNight)

            VStack{
                CityView(cityName: weatherModelData.responseWeatherData?.location.name)
                
                Spacer()
                
                CurrentWeatherView(currentTemp: weatherModelData.responseWeatherData?.current.temp_f,
                                   currentWeatherImage: isNight ? weatherModelData.responseWeatherData?.current.condition.code : weatherModelData.responseWeatherData?.current.condition.code,
                                   currentWeatherText: weatherModelData.responseWeatherData?.current.condition.text)
                
                HStack(spacing: 40) {
                    
                    VStack {
                        WeekDayWeather(dayOfTheWeek: weatherModelData.responseWeatherData?.forecast.forecastday[0].date,
                                       forecastedWeather: weatherModelData.responseWeatherData?.forecast.forecastday[0].day.condition.code,
                                       temp: weatherModelData.responseWeatherData?.forecast.forecastday[0].day.maxtemp_f)
                        Button("Hourly \nDetails") {
                            presentHourlyView.toggle()
                        }
                        .frame(width: 50)
                        .foregroundColor(.white)
                        .font(.system(size: 10, weight: .heavy))
                        .sheet(isPresented: $presentHourlyView) {
                            HourlyView(scrollToValue: 1, weatherModelData: weatherModelData, isNight: $isNight, topColorDay: $topColorDay, topColorNight: $topColorNight, bottomColorDay: $bottomColorDay, bottomColorNight: $bottomColorNight, isPresented: $presentHourlyView)
                        
                        }
                    }
                    VStack {
                        WeekDayWeather(dayOfTheWeek: weatherModelData.responseWeatherData?.forecast.forecastday[1].date,
                                       forecastedWeather: weatherModelData.responseWeatherData?.forecast.forecastday[1].day.condition.code,
                                       temp: weatherModelData.responseWeatherData?.forecast.forecastday[1].day.maxtemp_f)
                        Button("Hourly \nDetails") {
                            presentHourlyView.toggle()
                        }
                        .foregroundColor(.white)
                        .font(.system(size: 10, weight: .bold))
                        .sheet(isPresented: $presentHourlyView) {
                            HourlyView(scrollToValue: 1, weatherModelData: weatherModelData, isNight: $isNight, topColorDay: $topColorDay, topColorNight: $topColorNight, bottomColorDay: $bottomColorDay, bottomColorNight: $bottomColorNight, isPresented: $presentHourlyView)
                        }
                    }
                    VStack {
                        WeekDayWeather(dayOfTheWeek: weatherModelData.responseWeatherData?.forecast.forecastday[2].date,
                                       forecastedWeather: weatherModelData.responseWeatherData?.forecast.forecastday[2].day.condition.code,
                                       temp: weatherModelData.responseWeatherData?.forecast.forecastday[2].day.maxtemp_f)
                        Button("Hourly \nDetails") {
                            presentHourlyView.toggle()
                        }
                        .foregroundColor(.white)
                        .font(.system(size: 10, weight: .medium))
                        .sheet(isPresented: $presentHourlyView) {
                            HourlyView(scrollToValue: 1, weatherModelData: weatherModelData, isNight: $isNight, topColorDay: $topColorDay, topColorNight: $topColorNight, bottomColorDay: $bottomColorDay, bottomColorNight: $bottomColorNight, isPresented: $presentHourlyView)
                        }
                    }
                    
                }
                    
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButtonView(buttonTitle: "Change Day Time",
                                  backgroundColor: isNight ? Color("myMint"): .white,
                                  foregroundColor: isNight ? .white: .blue)
                }
                Spacer()
                
            }
        }
        .environmentObject(weatherModelData)
        .onAppear(perform: weatherModelData.checkIfServicesAreEnabled)
        //.onAppear(perform: weatherModelData.getWeather)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ContentViewModel())
    }
}
