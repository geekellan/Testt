//
//  Event.swift
//  Test
//
//  Created by Ellan Esenaliev on 10/2/20.
//

import Foundation

class Event {
    var startTime: Date?
    var endTime: Date?
    var name: String!
}

extension Event: Presentable {
    var title: String {
        return name
    }
    
    var details: String {
        var str = "Name: \(name!)"
        str += startTime != nil ? "\nStartTime \(string(from: startTime!))" : ""
        str += endTime != nil ? "\nEndTime: \(string(from: endTime!))" : ""
        return str
    }
}
