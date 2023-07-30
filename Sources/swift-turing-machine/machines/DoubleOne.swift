//
//  DoubleOne.swift
//  
//
//  Created by Jerome Bach on 29/07/2023.
//

import Foundation

extension Machine {
    static func DoubleOne(ruban: Ruban) -> Machine {
        let steps: [Step] = [
            Step(start: Start, read: "0", change: Final, write: "0", direction: .right),
            Step(start: Start, read: "1", change: 2, write: "0", direction: .right),
            Step(start: 2, read: "1", change: 2, write: "1", direction: .right),
            Step(start: 2, read: "0", change: 3, write: "0", direction: .right),
            Step(start: 2, read: Blank, change: 3, write: "0", direction: .right),
            Step(start: 3, read: "1", change: 3, write: "1", direction: .right),
            Step(start: 3, read: "0", change: 4, write: "1", direction: .left),
            Step(start: 3, read: Blank, change: 4, write: "1", direction: .left),
            Step(start: 4, read: "1", change: 4, write: "1", direction: .left),
            Step(start: 4, read: "0", change: 5, write: "0", direction: .left),
            Step(start: 4, read: Blank, change: 5, write: "0", direction: .left),
            Step(start: 5, read: "1", change: 5, write: "1", direction: .left),
            Step(start: 5, read: "0", change: Start, write: "1", direction: .right),
            Step(start: 5, read: Blank, change: Start, write: "1", direction: .right)
        ]
        let machine = Machine(ruban: ruban, steps: steps)
        return machine
    }
}
