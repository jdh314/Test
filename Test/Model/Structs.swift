//
//  ResponseStructs.swift
//  Test
//
//  Created by Jonathan Hogue on 11/5/21.
//

import Foundation

struct WeatherStruct: Codable {
    let location: Location
    let current: Current
    let forecast: Forecast
}

struct Location: Codable {
    let name: String
    let region: String
    let country: String
    let lat: Double
    let lon: Double
    let tz_id: String
    let localtime_epoch: Int
    let localtime: String
}

struct Current: Codable {
    let temp_f: Double?
    let is_day: Int
    let condition: Condition
    let uv: Int
    
}

struct Condition: Codable {
    let text: String?
    let iconURL: String?
    let code: Int?
    
    private enum CodingKeys: String, CodingKey {
        case text
        case iconURL = "icon"
        case code
    }
    
}

struct Forecast: Codable {
    let forecastday: [Forecastday]
}

struct Forecastday: Codable, Identifiable {
    let id = UUID()
    let date: String
    let date_epoch: Int
    let day: Day
    let hour: [Hour]
}

struct Day: Codable {
    let maxtemp_f: Double
    let mintemp_f: Double
    let daily_will_it_rain: Int
    let daily_chance_of_rain: Int
    let daily_will_it_snow: Int
    let daily_chance_of_snow: Int
    let condition: Condition
    
}

struct Hour: Codable {
    let time_epoch: Int
    let time: String
    let temp_f: Double
    let is_day: Int
    let condition: Condition
    let feelslike_f: Double
    let windchill_f: Double
    let heatindex_f: Double
    let will_it_rain: Int
    let chance_of_rain: Int
    let will_it_snow: Int
    let chance_of_snow: Int
}

struct ForecastdayForView {
    let id = UUID()
    let date: String
    let date_epoch: Int
    let day: Day
    let hour: [Hour]
}

let dayCodeIcons: [Int: String] = [1000: "sun.max.fill",
                             1003: "cloud.sun.fill",
                             1006: "cloud.sun.fill",
                             1009: "cloud.fill",
                             1030: "cloud.drizzle.fill",
                             1063: "cloud.drizzle.fill",
                             1066: "cloud.snow.fill",
                             1069: "cloud.sleet.fill",
                             1072: "cloud.sleet.fill",
                             1087: "cloud.bolt.fill",
                             1114: "cloud.snow.fill",
                             1117: "snowflake.circle.fill",
                             1135: "cloud.fog.fill",
                             1147: "cloud.fog.fill",
                             1150: "cloud.drizzle.fill",
                             1153: "cloud.drizzle.fill",
                             1168: "cloud.sleet.fill",
                             1171: "cloud.sleet.fill",
                             1180: "cloud.rain.fill",
                             1183: "cloud.rain.fill",
                             1186: "cloud.rain.fill",
                             1189: "cloud.heavyrain.fill",
                             1192: "cloud.heavyrain.fill",
                             1195: "cloud.heavyrain.fill",
                             1198: "cloud.sleet.fill",
                             1201: "cloud.sleet.fill",
                             1204: "cloud.sleet.fill",
                             1207: "cloud.sleet.fill",
                             1210: "cloud.snow.fill",
                             1213: "cloud.snow.fill",
                             1216: "cloud.snow.fill",
                             1219: "cloud.snow.fill",
                             1222: "cloud.snow.fill",
                             1225: "cloud.snow.fill",
                             1237: "cloud.hail.fill",
                             1240: "cloud.rain.fill",
                             1243: "cloud.heavyrain.fill",
                             1246: "cloud.heavyrain.fill",
                             1249: "cloud.sleet.fill",
                             1252: "cloud.sleet.fill",
                             1255: "cloud.snow.fill",
                             1258: "cloud.snow.fill",
                             1261: "cloud.hail.fill",
                             1264: "cloud.hail.fill",
                             1273: "cloud.bolt.rain.fill",
                             1279: "cloud.bolt.rain.fill",
                             1282: "cloud.bolt.fill"]

//let nightCodeIcons: [Int: String] = [1000: 113,
//                             1003: 116,
//                             1006: 119,
//                             1009: 122,
//                             1030: 143,
//                             1063: 176,
//                             1066: 179,
//                             1069: 182,
//                             1072: 185,
//                             1087: 200,
//                             1114: 227,
//                             1117: 230,
//                             1135: 248,
//                             1147: 260,
//                             1150: 263,
//                             1153: 266,
//                             1168: 281,
//                             1171: 284,
//                             1180: 293,
//                             1183: 296,
//                             1186: 299,
//                             1189: 302,
//                             1192: 305,
//                             1195: 308,
//                             1198: 311,
//                             1201: 314,
//                             1204: 317,
//                             1207: 320,
//                             1210: 323,
//                             1213: 326,
//                             1216: 329,
//                             1219: 332,
//                             1222: 335,
//                             1225: 338,
//                             1237: 350,
//                             1240: 353,
//                             1243: 356,
//                             1246: 359,
//                             1249: 362,
//                             1252: 365,
//                             1255: 368,
//                             1258: 371,
//                             1261: 374,
//                             1264: 377,
//                             1273: 386,
//                             1279: 392,
//                             1282: 395]
//
