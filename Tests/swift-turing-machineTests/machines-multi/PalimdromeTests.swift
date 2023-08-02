//
//  File.swift
//  
//
//  Created by Jerome Bach on 01/08/2023.
//

import Foundation
import XCTest
@testable import swift_turing_machine

final class PalindromeTests: XCTestCase {
    
    func testA() throws {
        let ruban: Ruban = [Blank, "a", "b", "a", Blank]
        var machine = MachineMulti.Palindrome(ruban: ruban)
        machine.run()
        XCTAssertEqual(machine.rubans[0], machine.rubans[1])
    }
}
