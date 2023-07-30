//
//  CompareTwoUnary.swift
//  
//
//  Created by Jerome Bach on 30/07/2023.
//

import Foundation

extension Machine {
    /// Compare to unary
    /// - Parameter ruban: Ruban
    /// - Returns: Machine
    static func CompareTwoUnary(ruban: Ruban) -> Machine {
        let steps: [Step] = [
            Step(start: Start, read: "1", change: 2, write: "0", direction: .left),
            Step(start: Start, read: "0", change: Start, write: "0", direction: .left),
            Step(start: Start, read: Blank, change: Start, write: Blank, direction: .left),
            Step(start: 2, read: "1", change: 3, write: "1", direction: .right),
            Step(start: 2, read: Blank, change: 5, write: Blank, direction: .left),
            Step(start: 3, read: "1", change: 4, write: "0", direction: .right),
            Step(start: 3, read: "0", change: 3, write: "0", direction: .right),
            Step(start: 3, read: Blank, change: 3, write: Blank, direction: .right),
            Step(start: 4, read: "1", change: Start, write: "1", direction: .left),
            Step(start: 4, read: Blank, change: 6, write: Blank, direction: .right),
            Step(start: 5, read: Blank, change: Final, write: "1", direction: .right),
            Step(start: 6, read: Blank, change: Final, write: "1", direction: .right)
        ]
        let machine = Machine(ruban: ruban, steps: steps)
        return machine
    }
}
