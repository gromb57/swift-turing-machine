//
//  Step.swift
//  
//
//  Created by Jerome Bach on 29/07/2023.
//

import Foundation

// MARK: State
typealias State = Int

let Start: State = 1
let Final: State = Int.max

// MARK: Symbol
typealias Symbol = Character

let Blank: Symbol = "B"

// MARK: Direction
enum Direction {
    case left
    case right
}

// MARK: Step
struct Step {
    var start: State
    var read: Symbol
    var change: State
    var write: Symbol
    var direction: Direction
}
