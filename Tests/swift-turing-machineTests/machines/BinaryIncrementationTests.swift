//
//  BinaryIncrementationTests.swift
//  
//
//  Created by Jerome Bach on 29/07/2023.
//

import Foundation
import XCTest
@testable import swift_turing_machine

final class BinaryIncrementationTests: XCTestCase {
    func testA() throws {
        let ruban: Ruban = [Blank, "1", "0", "1", Blank]
        var machine = Machine.BinaryIncrementation(ruban: ruban)
        machine.run()
        let expected: Ruban = [Blank, "1", "1", "0", Blank]
        XCTAssertEqual(machine.ruban, expected)
    }

    func testB() throws {
        let ruban: Ruban = [Blank, "1", "1", "1", Blank]
        var machine = Machine.BinaryIncrementation(ruban: ruban)
        machine.run()
        let expected: Ruban = [Blank, "1", "0", "0", "0", Blank]
        XCTAssertEqual(machine.ruban, expected)
    }
}
