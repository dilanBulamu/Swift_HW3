//
//  TableWorker.swift
//  dfbulamuPW3
//
//  Created by Dilan Bulamu on 15.10.2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class TableWorker {

    // MARK: - Properties

    typealias Models = TableModels

    // MARK: - Methods

    // MARK: Screen Specific Validation

    func validate(exampleVariable: String?) -> Models.TableError? {
        var error: Models.TableError?

        if exampleVariable?.isEmpty == false {
            error = nil
        } else {
            error = Models.TableError(type: .emptyExampleVariable)
        }

        return error
    }
}
