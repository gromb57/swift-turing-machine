//
//  BinaryIncrementation.swift
//  
//
//  Created by Jerome Bach on 29/07/2023.
//

import Foundation

extension Machine {
    static func BinaryIncrementation(ruban: Ruban) -> Machine {
        let steps: [Step] = [
            Step(start: Start, read: "0", change: Start, write: "0", direction: .right),
            Step(start: Start, read: "1", change: Start, write: "1", direction: .right),
            Step(start: Start, read: Blank, change: 2, write: Blank, direction: .left),
            Step(start: 2, read: "0", change: 3, write: "1", direction: .left),
            Step(start: 2, read: "1", change: 2, write: "0", direction: .left),
            Step(start: 2, read: Blank, change: 3, write: "1", direction: .left),
            Step(start: 3, read: "0", change: 3, write: "0", direction: .left),
            Step(start: 3, read: "1", change: 3, write: "1", direction: .left),
            Step(start: 3, read: Blank, change: Final, write: Blank, direction: .right),
        ]
        let machine = Machine(ruban: ruban, steps: steps)
        return machine
    }
}
