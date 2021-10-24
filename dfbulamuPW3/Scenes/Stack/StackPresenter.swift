//
//  StackPresenter.swift
//  dfbulamuPW3
//
//  Created by Dilan Bulamu on 15.10.2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol StackPresentationLogic {
    func presentFetchFromLocalDataStore(with response: StackModels.FetchFromLocalDataStore.Response)
    func presentFetchFromRemoteDataStore(with response: StackModels.FetchFromRemoteDataStore.Response)
    func presentTrackAnalytics(with response: StackModels.TrackAnalytics.Response)
    func presentPerformStack(with response: StackModels.PerformStack.Response)
}

class StackPresenter: StackPresentationLogic {

    // MARK: - Properties

    typealias Models = StackModels
    weak var viewController: StackDisplayLogic?

    // MARK: - Use Case - Fetch From Local DataStore

    func presentFetchFromLocalDataStore(with response: StackModels.FetchFromLocalDataStore.Response) {
        let translation = "Some localized text."
        let viewModel = Models.FetchFromLocalDataStore.ViewModel(exampleTranslation: translation)
        viewController?.displayFetchFromLocalDataStore(with: viewModel)
    }

    // MARK: - Use Case - Fetch From Remote DataStore

    func presentFetchFromRemoteDataStore(with response: StackModels.FetchFromRemoteDataStore.Response) {
        let formattedExampleVariable = response.exampleVariable ?? ""
        let viewModel = Models.FetchFromRemoteDataStore.ViewModel(exampleVariable: formattedExampleVariable)
        viewController?.displayFetchFromRemoteDataStore(with: viewModel)
    }

    // MARK: - Use Case - Track Analytics

    func presentTrackAnalytics(with response: StackModels.TrackAnalytics.Response) {
        let viewModel = Models.TrackAnalytics.ViewModel()
        viewController?.displayTrackAnalytics(with: viewModel)
    }

    // MARK: - Use Case - Stack

    func presentPerformStack(with response: StackModels.PerformStack.Response) {
        var responseError = response.error

        if let error = responseError {
            switch error.type {
            case .emptyExampleVariable:
                responseError?.message = "Localized empty/nil error message."

            case .networkError:
                responseError?.message = "Localized network error message."
            }
        }

        let viewModel = Models.PerformStack.ViewModel(error: responseError)
        viewController?.displayPerformStack(with: viewModel)
    }
}
