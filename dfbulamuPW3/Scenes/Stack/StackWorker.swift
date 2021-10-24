//
//  StackWorker.swift
//  dfbulamuPW3
//
//  Created by Dilan Bulamu on 15.10.2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class StackWorker {

    // MARK: - Properties

    typealias Models = StackModels

    // MARK: - Methods

    // MARK: Screen Specific Validation

    func validate(exampleVariable: String?) -> Models.StackError? {
        var error: Models.StackError?

        if exampleVariable?.isEmpty == false {
            error = nil
        } else {
            error = Models.StackError(type: .emptyExampleVariable)
        }

        return error
    }
}
