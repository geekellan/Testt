//
//  Notice.swift
//  Test
//
//  Created by Ellan Esenaliev on 10/2/20.
//

import Foundation

struct Notice {
    var flightDate: Date?
    var gate: String?
}

extension Notice: Presentable {
    var title: String {
        return gate ?? "Gate not avalaible"
    }
    
    var details: String {
        var str = "Name: \(title)\nFlight date: "
        str += flightDate != nil ? string(from: flightDate!) : "not avalaible"
        return str
    }
}
