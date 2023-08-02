//
//  CompareTwoUnaryTests.swift
//  
//
//  Created by Jerome Bach on 30/07/2023.
//


import Foundation
import XCTest
@testable import swift_turing_machine

final class CompareTwoUnaryTests: XCTestCase {
    
    /// if X <= Y
    func testA() throws {
        let ruban: Ruban = [Blank, "1", "1", Blank, "1", "1", "1", Blank]
        var machine = Machine.CompareTwoUnary(ruban: ruban)
        machine.position = 3
        machine.run()
        let expected: Ruban = [Blank, "1", Blank, "0", "0", Blank, "0", "1", "1", Blank]
        XCTAssertEqual(machine.ruban, expected)
    }
    
    /// if X > Y
    func testB() throws {
        let ruban: Ruban = [Blank, "1", "1", "1", Blank, "1", "1", Blank]
        var machine = Machine.CompareTwoUnary(ruban: ruban)
        machine.position = 3
        machine.run()
        let expected: Ruban = [Blank, "1", "0", "0", Blank, "0", "0", Blank, "1"]
        XCTAssertEqual(machine.ruban, expected)
    }
}
