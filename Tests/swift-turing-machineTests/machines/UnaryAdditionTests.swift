//
//  UnaryAdditionTests.swift
//  
//
//  Created by Jerome Bach on 30/07/2023.
//

import Foundation
import XCTest
@testable import swift_turing_machine

final class UnaryAdditionTests: XCTestCase {

    func testA() throws {
        let ruban: Ruban = [Blank, "1", "0", "1", Blank]
        var machine = Machine.UnaryAddition(ruban: ruban)
        machine.run()
        let expected: Ruban = [Blank, "1", "1", "1", Blank]
        XCTAssertEqual(machine.ruban, expected)
    }
    
    func testB() throws {
        let ruban: Ruban = [Blank, "1", "1", "0", "1", "1", "1", Blank]
        var machine = Machine.UnaryAddition(ruban: ruban)
        machine.run()
        let expected: Ruban = [Blank, "1", "1", "1", "1", "1", "1", Blank]
        XCTAssertEqual(machine.ruban, expected)
    }
}
