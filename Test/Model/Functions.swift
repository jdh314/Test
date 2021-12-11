//
//  Functions.swift
//  Test
//
//  Created by Jonathan Hogue on 12/10/21.
//

import Foundation

func isDayOfWeekEmpty(date: String?) -> String {
    guard let checkedDate = date  else {
        return "--"
    }
    return getDayOfWeekFromDate(date: checkedDate)
}

func getDayOfWeekFromDate(date: String) -> String {
    let formatter = DateFormatter()
    let calendar = Calendar.init(identifier: .gregorian)
    formatter.dateFormat = "yyyy-MM-dd"
    let formattedDate = formatter.date(from: date)
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
    guard let checkedTime = timeToCheck else {
        return "--"
    }
    guard let spaceIndex = checkedTime.firstIndex(of: " ") else {
        print("there was no space found in the time string")
        return("--")
    }
    return String(checkedTime[checkedTime.index(after: spaceIndex)...])
}
