//
//  DateComponents+Utils.swift
//  Bank Application
//
//  Created by Florian Rath on 27.12.24.
//

import Foundation

extension DateComponents {
    func toDate(calendar: Calendar = .current) -> Date {
        calendar.date(from: self) ?? Date()
    }
}
