//
//  UnaryAddition.swift
//  
//
//  Created by Jerome Bach on 30/07/2023.
//

import Foundation

extension Machine {
    /// Addition to number separate by a "0"
    /// - Parameter ruban: Ruban
    /// - Returns: Machine
    static func UnaryAddition(ruban: Ruban) -> Machine {
        let steps: [Step] = [
            Step(start: Start, read: "1", change: Start, write: "1", direction: .right),
            Step(start: Start, read: "0", change: 2, write: "1", direction: .right),
            Step(start: 2, read: "1", change: 2, write: "1", direction: .right),
            Step(start: 2, read: Blank, change: Final, write: Blank, direction: .right),
        ]
        let machine = Machine(ruban: ruban, steps: steps)
        return machine
    }
}
