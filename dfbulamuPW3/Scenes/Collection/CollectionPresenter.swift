//
//  CollectionPresenter.swift
//  dfbulamuPW3
//
//  Created by Dilan Bulamu on 15.10.2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol CollectionPresentationLogic {
    func presentFetchFromLocalDataStore(with response: CollectionModels.FetchFromLocalDataStore.Response)
    func presentFetchFromRemoteDataStore(with response: CollectionModels.FetchFromRemoteDataStore.Response)
    func presentTrackAnalytics(with response: CollectionModels.TrackAnalytics.Response)
    func presentPerformCollection(with response: CollectionModels.PerformCollection.Response)
}

class CollectionPresenter: CollectionPresentationLogic {

    // MARK: - Properties

    typealias Models = CollectionModels
    weak var viewController: CollectionDisplayLogic?

    // MARK: - Use Case - Fetch From Local DataStore

    func presentFetchFromLocalDataStore(with response: CollectionModels.FetchFromLocalDataStore.Response) {
        let translation = "Some localized text."
        let viewModel = Models.FetchFromLocalDataStore.ViewModel(exampleTranslation: translation)
        viewController?.displayFetchFromLocalDataStore(with: viewModel)
    }

    // MARK: - Use Case - Fetch From Remote DataStore

    func presentFetchFromRemoteDataStore(with response: CollectionModels.FetchFromRemoteDataStore.Response) {
        let formattedExampleVariable = response.exampleVariable ?? ""
        let viewModel = Models.FetchFromRemoteDataStore.ViewModel(exampleVariable: formattedExampleVariable)
        viewController?.displayFetchFromRemoteDataStore(with: viewModel)
    }

    // MARK: - Use Case - Track Analytics

    func presentTrackAnalytics(with response: CollectionModels.TrackAnalytics.Response) {
        let viewModel = Models.TrackAnalytics.ViewModel()
        viewController?.displayTrackAnalytics(with: viewModel)
    }

    // MARK: - Use Case - Collection

    func presentPerformCollection(with response: CollectionModels.PerformCollection.Response) {
        var responseError = response.error

        if let error = responseError {
            switch error.type {
            case .emptyExampleVariable:
                responseError?.message = "Localized empty/nil error message."

            case .networkError:
                responseError?.message = "Localized network error message."
            }
        }

        let viewModel = Models.PerformCollection.ViewModel(error: responseError)
        viewController?.displayPerformCollection(with: viewModel)
    }
}
