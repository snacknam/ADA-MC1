//
//  Extension+Date.swift
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
