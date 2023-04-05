//
//  MoonData.swift
//  MoonPhaseForStarPhotography
//
//  Created by 관식 on 2023/04/05.
//

import Foundation

extension Date {
    static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        return dateFormatter
    }()
    
    init(_ text: String) {
        self = Self.dateFormatter.date(from: text)!
    }
}

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
