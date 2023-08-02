//
//  DoubleOneTests.swift
//  
//
//  Created by Jerome Bach on 29/07/2023.
//

import Foundation
import XCTest
@testable import swift_turing_machine

final class DoubleOneTests: XCTestCase {
    func testA() throws {
        let ruban: Ruban = [Blank, "1", Blank]
        var machine = Machine.DoubleOne(ruban: ruban)
        machine.run()
        let expected: Ruban = [Blank, "1", "0", "1", Blank]
        XCTAssertEqual(machine.ruban, expected)
    }

    func testB() throws {
        let ruban: Ruban = [Blank, "1", "1", Blank]
        var machine = Machine.DoubleOne(ruban: ruban)
        machine.run()
        let expected: Ruban = [Blank, "1", "1", "0", "1", "1", Blank]
        XCTAssertEqual(machine.ruban, expected)
    }
    
    func testC() throws {
        let ruban: Ruban = [Blank, "1", "1", "1", Blank]
        var machine = Machine.DoubleOne(ruban: ruban)
        machine.run()
        let expected: Ruban = [Blank, "1", "1", "1", "0", "1", "1", "1", Blank]
        XCTAssertEqual(machine.ruban, expected)
    }
}
