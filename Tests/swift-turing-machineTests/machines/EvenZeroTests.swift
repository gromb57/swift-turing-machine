//
//  EvenZeroTests.swift
//  
//
//  Created by Jerome Bach on 30/07/2023.
//

import Foundation
import XCTest
@testable import swift_turing_machine

final class EvenZeroTests: XCTestCase {

    func test() throws {
        let ruban: Ruban = [Blank, "0", "1", "0", "1", "0", "1", "0", "1", "0", "1", "1", Blank]
        var machine = Machine.EvenZero(ruban: ruban)
        machine.run()
        let expected: Ruban = ruban + ["0"]
        XCTAssertEqual(machine.ruban, expected)
    }
}
