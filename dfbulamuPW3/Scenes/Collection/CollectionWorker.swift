//
//  CollectionWorker.swift
//  dfbulamuPW3
//
//  Created by Dilan Bulamu on 15.10.2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class CollectionWorker {

    // MARK: - Properties

    typealias Models = CollectionModels

    // MARK: - Methods

    // MARK: Screen Specific Validation

    func validate(exampleVariable: String?) -> Models.CollectionError? {
        var error: Models.CollectionError?

        if exampleVariable?.isEmpty == false {
            error = nil
        } else {
            error = Models.CollectionError(type: .emptyExampleVariable)
        }

        return error
    }
}
