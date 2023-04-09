//
//  MoonData.swift
//  MoonPhaseForStarPhotography
//
//  Created by 관식 on 2023/04/05.
//

import Foundation

struct MoonData {
    
    let moonExpression: [Moons] = [
        Moons(title: "New Moon", description: "The stars are shining bright tonight, capture the beauty of the night sky in your photos!"),
        Moons(title: "Waxing Crescent", description: "A thin sliver of a moon in the sky, but the stars are still shining bright. Get your camera ready for a stunning shot!"),
        Moons(title: "Waxing Crescent", description: "A thin sliver of a moon in the sky, but the stars are still shining bright. Get your camera ready for a stunning shot!"),
        Moons(title: "First Quater", description: "The moon is half-lit tonight, but the stars are still out in full force. Capture the contrast of light and dark in your photos!"),
        Moons(title: "Waxing Gibbous", description: "The moon is getting fuller and brighter, making it challenging to capture the stars. Take advantage of the moon's brightness and capture some stunning shots of it instead!"),
        Moons(title: "Waxing Gibbous", description: "The moon is getting fuller and brighter, making it challenging to capture the stars. Take advantage of the moon's brightness and capture some stunning shots of it instead!"),
        Moons(title: "Full Moon", description: "The moon is shining so brightly tonight, it's difficult to capture the stars in your photos. Try photographing the beautiful full moon instead!"),
        Moons(title: "Waning Gibbous", description: "The moon is starting to fade, and the stars are getting easier to see. But don't forget about the beautiful moon, try taking some unique shots of it before it disappears!"),
        Moons(title: "Waning Gibbous", description: "The moon is starting to fade, and the stars are getting easier to see. But don't forget about the beautiful moon, try taking some unique shots of it before it disappears!"),
        Moons(title: "Third Quarter", description: "The moon is half-lit again, but the stars are still putting on a show. Get your camera ready for some stunning shots!"),
        Moons(title: "Waning Crescent", description: "The moon is almost gone, but the stars are still shining bright. Take advantage of the dark sky and capture some amazing photos tonight!"),
        Moons(title: "Waning Crescent", description: "The moon is almost gone, but the stars are still shining bright. Take advantage of the dark sky and capture some amazing photos tonight!"),
    ]
}

func moonPhase(_ date: Date) -> Int {
    
//    let lunarPhaseStart = Date("01/07/1970")
//    let daysSinceStart = Calendar.current.dateComponents(
//        [.day],
//        from: lunarPhaseStart,
//        to: date
//    ).day!
//
//    let seconds = daysSinceStart * 86400 + 12300
//    let lunarMonths = seconds % 2551443
//    let lunarMonthPart = lunarMonths / 637861
//    let secondsSinceMainPhase = lunarMonths % 637861
//
//    let index = 2 * lunarMonthPart + (86400 <= secondsSinceMainPhase ? 1 : 0)
//    //    let index = 7
//    //    let lunarPhases = ["🌑", "🌒", "🌓", "🌔", "🌕", "🌖", "🌗", "🌘"]
//    //    let lunarPhase = lunarPhases[index]
//    return index
    
    let lunarPhaseStart = Date("01/07/1970")
    let daysSinceStart = Calendar.current.dateComponents([.day], from: lunarPhaseStart, to: date).day!
    let seconds = daysSinceStart * 86400 + 12300
    let lunarMonths = seconds % 2551443
    let lunarMonthPart = Double(lunarMonths) / 212765.25
    let index = Int(lunarMonthPart.rounded()) % 12
    return index
}
