//
//  Machine.swift
//  
//
//  Created by Jerome Bach on 29/07/2023.
//

import Foundation

struct Machine {
    enum RunState {
        case waiting
        case running
        case stopped
    }

    var ruban: Ruban
    var steps: [Step]
    var position: Int = NSNotFound
    var state: State = Start
    private var runState: RunState = .waiting
    
    var debugDescription: String {
        return "\(ruban) Position:\(position) State:\(state)"
    }
    
    init(ruban: Ruban, steps: [Step], position: Int = NSNotFound, state: State = Start) {
        self.ruban = ruban
        self.steps = steps
        self.position = position
        self.state = state
    }
    
    mutating func run() {
        if self.runState != .waiting {
            print("This machine already run, please create a new one.")
            return
        }

        if self.position == NSNotFound {
            self.position = 1
        }
        self.runState = .running

        print(self.debugDescription)
        
        while process() {
            print(self.debugDescription)
        }
        self.runState = .stopped
    }

    private mutating func process() -> Bool {
        guard self.state != Final else {
            // legitimate reason to stop processing
            return false
        }
        guard let step = self.findStep() else {
            // configuration/execution error
            return false
        }
        self.state = step.change
        
        if self.position == self.ruban.count {
            self.ruban.append(step.write)
        } else if self.ruban[self.position] == Blank && step.write != Blank {
            if (self.position + 1) == Start  {
                self.ruban.insert(step.write, at: self.position + 1)
                self.position += 1
            } else {
                self.ruban.insert(step.write, at: self.position)
            }
        } else {
            self.ruban[self.position] = step.write
        }
        
        self.position += step.direction == .right ? 1 : -1
        
        // fix: limit of using an array
        if self.position == -1 {
            self.ruban.insert(Blank, at: 0)
            self.position = 0
        }
        
        return true
    }

    private func findStep() -> Step? {
        return self.steps.first { step in
            return step.start == self.state && ((self.position == self.ruban.count) || (self.position < self.ruban.count && step.read == self.ruban[self.position]))
        }
    }
}
