//
//  MoonData.swift
//  MoonPhaseForStarPhotography
//
//  Created by 관식 on 2023/04/05.
//

import Foundation

struct MoonData {
    
    let moonExpression: [Moon] = [
        Moon(title: "new moon", description: "today is new moon."),
        Moon(title: "waxing crescent", description: "today is waxing crescent."),
        Moon(title: "first quater", description: "today is first quater."),
        Moon(title: "waxing gibbous", description: "today is waxing gibbous."),
        Moon(title: "full moon", description: "today is full moon."),
        Moon(title: "waning gibbous", description: "today is waning gibbous."),
        Moon(title: "last quarter", description: "today is last quarter"),
        Moon(title: "waning crescent", description: "today is waning crescent."),
    ]
    
}

func moonPhase() -> Int {
    let lunarPhaseStart = Date("01/07/1970")
    let daysSinceStart = Calendar.current.dateComponents(
        [.day],
        from: lunarPhaseStart,
        to: Date()
    ).day!

    let seconds = daysSinceStart * 86400 + 12300
    let lunarMonths = seconds % 2551443
    let lunarMonthPart = lunarMonths / 637861
    let secondsSinceMainPhase = lunarMonths % 637861

    let index = 2 * lunarMonthPart + (86400 <= secondsSinceMainPhase ? 1 : 0)

//        let lunarPhases = ["🌑", "🌒", "🌓", "🌔", "🌕", "🌖", "🌗", "🌘"]
//        let lunarPhase = lunarPhases[index]

    return index
}
