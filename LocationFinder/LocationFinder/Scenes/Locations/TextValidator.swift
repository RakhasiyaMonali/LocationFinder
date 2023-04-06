//
//  TextValidator.swift
//  LocationFinder
//
//  Created by Monali on 25/06/22.
//

import Foundation

class ValidationError: Error {
    var message: String
    
    init(_ message: String) {
        self.message = message
    }
}

protocol ValidatorConvertible {
    func validated(_ value: String) throws -> String
}

enum ValidatorType {
    // can add another types of validation ex. email
    case requiredField(field: String)
}

enum ValidatorFactory {
    static func validatorFor(type: ValidatorType) -> ValidatorConvertible {
        switch type {
        case .requiredField(let fieldName): return RequiredFieldValidator(fieldName)
        }
    }
}

struct RequiredFieldValidator: ValidatorConvertible {
    private let fieldName: String
    
    init(_ field: String) {
        fieldName = field
    }
    
    func validated(_ value: String) throws -> String {
        guard !value.isEmpty else {
            throw ValidationError("Required field " + fieldName)
        }
        return value
    }
}
