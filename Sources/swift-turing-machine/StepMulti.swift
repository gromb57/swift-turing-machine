//
//  StepMulti.swift
//  
//
//  Created by Jerome Bach on 02/08/2023.
//

import Foundation

// MARK: Step
struct StepMulti {
    var start: State
    var read: [Symbol]
    var change: State
    var write: [Symbol]
    var direction: [Direction]
    
    init(start: State, read: [Symbol], change: State, write: [Symbol], direction: [Direction]) throws {
        if read.count != write.count || write.count != direction.count {
            throw RuntimeError("read, write, direction must have the same length")
        }
        self.start = start
        self.read = read
        self.change = change
        self.write = write
        self.direction = direction
    }
}
