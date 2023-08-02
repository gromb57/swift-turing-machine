//
//  RuntimeError.swift
//  
//
//  Created by Jerome Bach on 02/08/2023.
//

import Foundation

struct RuntimeError: LocalizedError {
    let description: String

    init(_ description: String) {
        self.description = description
    }

    var errorDescription: String? {
        description
    }
}
