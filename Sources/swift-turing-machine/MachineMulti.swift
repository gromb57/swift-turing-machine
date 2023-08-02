//
//  MachineMulti.swift
//  
//
//  Created by Jerome Bach on 01/08/2023.
//

import Foundation

/// Simulate a turing machine with many tape/ruban
struct MachineMulti {
    var rubans: [Ruban]
    var steps: [StepMulti]
    var positions: [Int]
    var state: State = Start
    private var __runState: Machine.RunState = .waiting
    var runState: Machine.RunState {
        return self.__runState
    }
    
    var debugDescription: String {
        return "\(rubans) Position:\(positions) State:\(state)"
    }
    
    // MARK: Initializers
    init(rubans: [Ruban], steps: [StepMulti], positions: [Int], state: State = Start) throws {
        if rubans.count != positions.count {
            throw RuntimeError("rubans, positions must have the same length")
        }
        for step in steps {
            if rubans.count != step.read.count {
                throw RuntimeError("rubans, positions and steps properties read, write, direction must have the same length")
            }
        }
        self.rubans = rubans
        self.steps = steps
        self.positions = positions
        self.state = state
    }
    
    // MARK: Setters
    @discardableResult
    mutating func setRunState(runState: Machine.RunState) -> Self {
        switch runState {
        case .waiting:
            // this state is forbidden to set
            break
        case .running:
            if self.__runState == .waiting {
                self.__runState = .running
            }
        case .stopped:
            if self.__runState == .running {
                self.__runState = .stopped
            }
        }
        return self
    }
    
    // MARK: Methods
    mutating func run() {
        if self.__runState != .waiting {
            print("This machine already run, please create a new one.")
            return
        }

        for index in self.positions.indices where self.positions[index] == NSNotFound {
            self.positions[index] = 1
        }
        self.__runState = .running

        print(self.debugDescription)
        
        while process() {
            print(self.debugDescription)
        }
        self.__runState = .stopped
    }

    mutating func process() -> Bool {
        guard self.state != Final else {
            // legitimate reason to stop processing
            return false
        }
        guard let step = self.findStep() else {
            // configuration/execution error
            return false
        }
        self.state = step.change
        
        for index in self.rubans.indices {
            if self.positions[index] == self.rubans[index].count {
                self.rubans[index].append(step.write[index])
            } else {
                self.set(step.write[index], at: index)
            }
            
            /*if self.positions[index] == self.rubans[index].count {
                self.rubans[index].append(step.write[index])
            } else if self.symbol(at: index) == Blank && step.write[index] != Blank {
                if (self.positions[index] + 1) == Start  {
                    self.rubans[index].insert(step.write[index], at: self.positions[index] + 1)
                    self.positions[index] += 1
                } else {
                    self.rubans[index].insert(step.write[index], at: self.positions[index])
                }
            } else {
                self.set(step.write[index], at: index)
            }*/
        
            switch step.direction[index] {
            case .left:
                self.positions[index] -= 1
            case .right:
                self.positions[index] += 1
            case .none:
                break
            }
            
            // fix: limit of using an array
            if self.positions[index] == -1 {
                self.rubans[index].insert(Blank, at: 0)
                self.positions[index] = 0
            }
        }
        
        return true
    }

    private func findStep() -> StepMulti? {
        return self.steps.first { step in
            return step.start == self.state && (self.isHeadOnLast || (/*self.position < self.ruban.count &&*/ step.read == self.readRubans))
        }
    }
    
    /// Return: true if all head(position) are on last element of its respective tape/ruban
    private var isHeadOnLast: Bool {
        var result: Bool = true
        for index in self.rubans.indices {
            result = result && self.positions[index] == self.rubans[index].count
        }
        return result
    }
    
    /// Read every tapes/rubans and return an array
    private var readRubans: [Symbol] {
        var result: [Symbol] = []
        for index in self.rubans.indices {
            result.append(self.symbol(at: index))
        }
        return result
    }

    private func symbol(at index: Int) -> Symbol {
        return self.rubans[index][self.positions[index]]
    }
    
    @discardableResult
    private mutating func set(_ symbol: Symbol, at index: Int)  -> Self {
        self.rubans[index][self.positions[index]] = symbol
        return self
    }
}
