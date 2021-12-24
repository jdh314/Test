//
//  Functions.swift
//  Test
//
//  Created by Jonathan Hogue on 12/10/21.
//

import Foundation
import SwiftUI

func isDayOfWeekEmpty(date: String?) -> String {
    guard let checkedDate = date  else {
        return "--"
    }
    let formatter = DateFormatter()
    let calendar = Calendar.init(identifier: .gregorian)
    formatter.dateFormat = "yyyy-MM-dd"
    let formattedDate = formatter.date(from: checkedDate)
    let calendarComponent = calendar.component(.weekday, from: formattedDate!)
    return convertWeekDayComponenet(componentWeekDay: calendarComponent)
}

func checkForEmptyImage(loadedImage: Int?) -> String {
    guard let checkedImageName = loadedImage else {
        return "questionmark"
    }
    return dayCodeIcons[checkedImageName]!
}

func convertCurrentTemp(temp: Double?) -> String {
    guard let convertedTemp = temp else {
        return "--"
    }
    return String(Int(convertedTemp))
}

func checkForEmptyWeatherText(loadedText: String?) -> String {
    guard let checkedCurrentWeatherText = loadedText else {
        return "--"
    }
    return checkedCurrentWeatherText
}
    
func checkAndReturnTime(timeToCheck: String?) -> String {
    var timeToReturn = ""
    guard let checkedTime = timeToCheck else {
        return "--"
    }
    guard let spaceIndex = checkedTime.firstIndex(of: " ") else {
        print("there was no space found in the time string")
        return("--")
    }
    let stringTime = String(checkedTime[checkedTime.index(after: spaceIndex)...])
    guard let dateFormat = DateFormatter.dateFormat (fromTemplate: "j",options:0, locale: Locale.current) else {
        print("could not get time format")
        return "--"
    }
    
    if dateFormat == "h a" {
        guard let intHour = Int(stringTime.dropLast(3)) else {
            print("the time did not convert to an Integer")
            return "--"
        }
        if intHour > 12 {
            timeToReturn = "\(intHour - 12):00 pm"
        } else if intHour == 00 {
            timeToReturn = "12:00 am"
        } else {
            timeToReturn = "\(intHour):00 am"
        }
    } else {
        timeToReturn = stringTime
    }
    return timeToReturn
}
