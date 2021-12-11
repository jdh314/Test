//
//  DateStuff.swift
//  Test
//
//  Created by Jonathan Hogue on 12/4/21.
//

import Foundation

func convertWeekDayComponenet(componentWeekDay: Int) -> String {

    switch componentWeekDay {
    case 1:
        return "Sun"
    case 2:
        return "Mon"
    case 3:
        return "Tue"
    case 4:
        return "Wed"
    case 5:
        return "Thu"
    case 6:
        return "Fri"
    case 7:
        return "Sat"
    default:
        return ""
    }
    
}

