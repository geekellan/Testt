//
//  Presentable.swift
//  Test
//
//  Created by Ellan Esenaliev on 10/4/20.
//

import Foundation

protocol Presentable {
    var title: String { get }
    var details: String { get }
}

extension Presentable {
    func string(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MMM-YYYY hh:mm"
        return formatter.string(from: date)
    }
    
    func string(from timeInterval: TimeInterval) -> String? {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .full

        return formatter.string(from: TimeInterval(timeInterval))!
    }
}
