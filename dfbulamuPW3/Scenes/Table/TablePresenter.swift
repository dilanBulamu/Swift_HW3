//
//  TablePresenter.swift
//  dfbulamuPW3
//
//  Created by Dilan Bulamu on 15.10.2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol TablePresentationLogic {
    func presentFetchFromLocalDataStore(with response: TableModels.FetchFromLocalDataStore.Response)
    func presentFetchFromRemoteDataStore(with response: TableModels.FetchFromRemoteDataStore.Response)
    func presentTrackAnalytics(with response: TableModels.TrackAnalytics.Response)
    func presentPerformTable(with response: TableModels.PerformTable.Response)
}

class TablePresenter: TablePresentationLogic {

    // MARK: - Properties

    typealias Models = TableModels
    weak var viewController: TableDisplayLogic?

    // MARK: - Use Case - Fetch From Local DataStore

    func presentFetchFromLocalDataStore(with response: TableModels.FetchFromLocalDataStore.Response) {
        let translation = "Some localized text."
        let viewModel = Models.FetchFromLocalDataStore.ViewModel(exampleTranslation: translation)
        viewController?.displayFetchFromLocalDataStore(with: viewModel)
    }

    // MARK: - Use Case - Fetch From Remote DataStore

    func presentFetchFromRemoteDataStore(with response: TableModels.FetchFromRemoteDataStore.Response) {
        let formattedExampleVariable = response.exampleVariable ?? ""
        let viewModel = Models.FetchFromRemoteDataStore.ViewModel(exampleVariable: formattedExampleVariable)
        viewController?.displayFetchFromRemoteDataStore(with: viewModel)
    }

    // MARK: - Use Case - Track Analytics

    func presentTrackAnalytics(with response: TableModels.TrackAnalytics.Response) {
        let viewModel = Models.TrackAnalytics.ViewModel()
        viewController?.displayTrackAnalytics(with: viewModel)
    }

    // MARK: - Use Case - Table

    func presentPerformTable(with response: TableModels.PerformTable.Response) {
        var responseError = response.error

        if let error = responseError {
            switch error.type {
            case .emptyExampleVariable:
                responseError?.message = "Localized empty/nil error message."

            case .networkError:
                responseError?.message = "Localized network error message."
            }
        }

        let viewModel = Models.PerformTable.ViewModel(error: responseError)
        viewController?.displayPerformTable(with: viewModel)
    }
}
