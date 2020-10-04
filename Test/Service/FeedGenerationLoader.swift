//
//  FeedGenerationLoader.swift
//  Test
//
//  Created by Ellan Esenaliev on 10/2/20.
//

import Foundation

protocol FeedLoader {
    func load(_ complition: @escaping ([Presentable]) -> Void)
}

struct FeedGenerationLoader: FeedLoader {
    enum `Type`: Int, CaseIterable {
        case event
        case move
        case notice
    }
    
    private let generator: Generatable
    
    init(generator: Generatable) {
        self.generator = generator
    }
    
    func load(_ complition: @escaping ([Presentable]) -> Void) {
        let dispatch = DispatchQueue(label: "feedGenerationLoader")
        dispatch.sync {
            let count = Int.random(in: 10...100)
            var data = [Presentable]()
            for _ in 0...count {
                let type = generateType()
                data.append(generate(for: type))
            }
            complition(data)
        }
    }
    
    private func generateType() -> Type {
        let index = Int.random(in: 0..<Type.allCases.count)
        return Type(rawValue: index)!
    }
    
    private func generate(for type: Type) -> Presentable {
        switch type {
        case .event:
            return generateEvent()
        case .move:
            return generateMove()
        case .notice:
            return generateNotice()
        }
    }
    
    private func generateEvent() -> Event {
        let event = Event()
        event.name = generator.generateString()
        let time = generator.generateDateFromTo()
        event.startTime = time.from
        event.endTime = time.to
        return event
    }
    
    private func generateMove() -> Move {
        let move = Move()
        move.fromPlace = generator.generateString()
        move.toPlace = generator.generateString()
        return move
    }
    
    private func generateNotice() -> Notice {
        var notice = Notice()
        notice.flightDate = generator.generateDateFromTo().from
        notice.gate = generator.generateString()
        return notice
    }
}
