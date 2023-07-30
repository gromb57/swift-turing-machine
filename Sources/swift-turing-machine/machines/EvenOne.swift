//
//  EvenOne.swift
//  
//
//  Created by Jerome Bach on 30/07/2023.
//

import Foundation

extension Machine {
    /// Tells us if the sequence contains an even number of 1
    ///  Yes: write a 1 after the sequence
    ///  No: write a 0 after the sequence
    /// - Parameter ruban: Ruban
    /// - Returns: Machine
    static func EvenOne(ruban: Ruban) -> Machine {
        let steps: [Step] = [
            Step(start: Start, read: "1", change: 2, write: "1", direction: .right),
            Step(start: Start, read: "0", change: Start, write: "0", direction: .right),
            Step(start: Start, read: Blank, change: 3, write: Blank, direction: .right),
            Step(start: 2, read: "1", change: Start, write: "1", direction: .right),
            Step(start: 2, read: "0", change: 2, write: "0", direction: .right),
            Step(start: 2, read: Blank, change: 4, write: Blank, direction: .right),
            Step(start: 3, read: Blank, change: Final, write: "1", direction: .right),
            Step(start: 4, read: Blank, change: Final, write: "0", direction: .right)
        ]
        let machine = Machine(ruban: ruban, steps: steps)
        return machine
    }
}
