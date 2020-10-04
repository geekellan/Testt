//
//  Generator.swift
//  Test
//
//  Created by Ellan Esenaliev on 10/4/20.
//

import Foundation

protocol Generatable {
    func generateString() -> String
    func generateTimeinterval() -> TimeInterval
    func generateDateFromTo() -> (from: Date, to: Date)
}

struct Generator: Generatable {
    func generateString() -> String {
        return UUID().uuidString
    }
    
    func generateTimeinterval() -> TimeInterval {
        return TimeInterval.random(in: 0..<10000)
    }
    
    func generateDateFromTo() -> (from: Date, to: Date) {
        let dateFrom = Date(timeIntervalSinceNow: generateTimeinterval())
        let dateTo = Date(timeInterval: generateTimeinterval(), since: dateFrom)
        return (dateFrom, dateTo)
    }
}
