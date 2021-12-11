//
//  HourlyView.swift
//  Test
//
//  Created by Jonathan Hogue on 12/10/21.
//

import SwiftUI

struct HourlyView: View {
    
    @State var scrollToValue: Int
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
                    Button("Close") {
                        isPresented.toggle()
                    }
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(.white)
                    .padding(30)
                }
                
                ScrollViewReader { proxy in
                    ScrollView {
                        ForEach(0..<3){ i in
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

//struct HourlyView_Previews: PreviewProvider {
//    static var previews: some View {
//        HourlyView(scrollToValue: 1, weatherModelData: ContentViewModel(), isNight: $isNight, topColorDay: $topColorDay, topColorNight: $topColorNight, bottomColorDay: $bottomColorDay, bottomColorNight: $bottomColorNight))
//    }
//}
