//
//  Move.swift
//  Test
//
//  Created by Ellan Esenaliev on 10/2/20.
//

import Foundation

class Move {
    var fromPlace: String?
    var toPlace: String?
    var estimateTime: TimeInterval?
}

extension Move: Presentable {
    var title: String {
        var str: String = ""
        
        if let from = fromPlace {
            str += from
        }
        
        if let to = toPlace {
            str += str.isEmpty ? to : "- \(to)"
        }
        
        return str
    }
    
    var details: String {
        var str = "From: "
        str += fromPlace != nil ? fromPlace! : "not available"
        
        str += "\nTo: "
        str += toPlace != nil ? toPlace! : "not available"
        str += "\nEstimate time: "
        if let time = estimateTime, let timeString = string(from: time) {
            str += timeString
        } else {
            str += "not available"
        }
        
        return str
    }
}

