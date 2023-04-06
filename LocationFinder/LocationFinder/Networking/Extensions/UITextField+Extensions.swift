//
//  UITextField+Extension.swift
//  ValidatorsMediumPost
//
//  Created by Arlind on 8/5/18.
//  Copyright © 2018 Arlind Aliu. All rights reserved.
//

import UIKit.UITextField

extension String {
    func validatedText(validationType: ValidatorType) throws -> String {
        let validator = ValidatorFactory.validatorFor(type: validationType)
        return try validator.validated(self)
    }
}
