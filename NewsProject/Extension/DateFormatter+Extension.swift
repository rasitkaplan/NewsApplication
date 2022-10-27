//
//  DateFormatter+Extension.swift
//  NewsProject
//
//  Created by rasit on 28.10.2022.
//

import Foundation

extension DateFormatter {
    static let iso8601Full: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()

    static let dateOnly: DateFormatter = {
         let formatter = DateFormatter()
         formatter.dateFormat = "dd/MM/yyyy"
         return formatter
    }()

    static func string(iso string: String?) -> String {
        var lastDate = Date()
        if let str = string {
            let date = DateFormatter.iso8601Full.date(from: str)
            lastDate = date ?? Date()
        }
        return  DateFormatter.dateOnly.string(from: lastDate)
    }
}
