//
//  Machine.swift
//  
//
//  Created by Jerome Bach on 29/07/2023.
//

import Foundation

struct Machine {
    var ruban: Ruban
    var steps: [Step]
    var position: Int = NSNotFound
    var state: State = NSNotFound
    
    var debugDescription: String {
        return "\(ruban) Position:\(position) State:\(state)"
    }
    
    mutating func run() {
        self.position = 1
        self.state = 1

        print(self.debugDescription)
        
        while process() {
            print(self.debugDescription)
        }
    }

    private mutating func process() -> Bool {
        guard self.state != Final else {
            // legitimate reason to stop processing
            return false
        }
        guard self.state < self.ruban.count else {
            // configuration/execution error
            return false
        }
        guard let step = self.findStep() else {
            // configuration/execution error
            return false
        }
        self.ruban[self.position] = step.write
        self.state = step.change
        self.position += step.direction == .right ? 1 : -1
        
        return true
    }

    private func findStep() -> Step? {
        return self.steps.first { Step in
            return Step.start == self.state && Step.read == self.ruban[self.position]
        }
    }
}
