//
//  EvenOneTests.swift
//  
//
//  Created by Jerome Bach on 30/07/2023.
//

import Foundation
import XCTest
@testable import swift_turing_machine

final class EvenOneTests: XCTestCase {

    func testA() throws {
        let ruban: Ruban = [Blank, "1", Blank]
        var machine = Machine.EvenOne(ruban: ruban)
        machine.run()
        let expected: Ruban = ruban + ["0"]
        XCTAssertEqual(machine.ruban, expected)
    }
    
    func testB() throws {
        let ruban: Ruban = [Blank, "1", "1", Blank]
        var machine = Machine.EvenOne(ruban: ruban)
        machine.run()
        let expected: Ruban = ruban + ["1"]
        XCTAssertEqual(machine.ruban, expected)
    }
    
    func testC() throws {
        let ruban: Ruban = [Blank, "1", "0", Blank]
        var machine = Machine.EvenOne(ruban: ruban)
        machine.run()
        let expected: Ruban = ruban + ["0"]
        XCTAssertEqual(machine.ruban, expected)
    }
    
    func testD() throws {
        let ruban: Ruban = [Blank, "0", "1", "0", "1", "0", "1", "0", "1", "0", "1", "1", Blank]
        var machine = Machine.EvenOne(ruban: ruban)
        machine.run()
        let expected: Ruban = ruban + ["1"]
        XCTAssertEqual(machine.ruban, expected)
    }
}
