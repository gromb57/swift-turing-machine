//
//  Palindrome.swift
//  
//
//  Created by Jerome Bach on 01/08/2023.
//

import Foundation

extension MachineMulti {
    static func Palindrome(ruban: Ruban) -> MachineMulti {
        let steps: [StepMulti]
        do {
            steps = [
                // q0
                try .init(start: Start, read: [Blank, Blank], change: Final, write: [Blank, Blank], direction: [.right, .right]),
                try .init(start: Start, read: ["a", Blank], change: 2, write: ["a", "a"], direction: [.right, .right]),
                try .init(start: Start, read: ["b", Blank], change: 2, write: ["b", "b"], direction: [.right, .right]),
                // qc
                try .init(start: 2, read: [Blank, Blank], change: 3, write: [Blank, Blank], direction: [.left, .none]),
                try .init(start: 2, read: ["a", Blank], change: 2, write: ["a", "a"], direction: [.right, .right]),
                try .init(start: 2, read: ["b", Blank], change: 2, write: ["b", "b"], direction: [.right, .right]),
                // qg
                try .init(start: 3, read: [Blank, Blank], change: 4, write: [Blank, Blank], direction: [.right, .left]),
                try .init(start: 3, read: ["a", Blank], change: 3, write: ["a", Blank], direction: [.left, .none]),
                try .init(start: 3, read: ["b", Blank], change: 3, write: ["b", Blank], direction: [.left, .none]),
                // qv
                try .init(start: 4, read: ["a", "a"], change: 4, write: ["a", "a"], direction: [.right, .left]),
                try .init(start: 4, read: ["b", "b"], change: 4, write: ["b", "b"], direction: [.right, .left]),
                try .init(start: 4, read: [Blank, Blank], change: Final, write: [Blank, Blank], direction: [.none, .none])
            ]
            
            let rubanB: Ruban = Ruban(repeating: Blank, count: ruban.count)
            
            return try MachineMulti(rubans: [ruban, rubanB], steps: steps, positions: [NSNotFound, NSNotFound])
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}
