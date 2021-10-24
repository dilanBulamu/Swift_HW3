//
//  CollectionInteractor.swift
//  dfbulamuPW3
//
//  Created by Dilan Bulamu on 15.10.2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol CollectionBusinessLogic {
    func fetchFromLocalDataStore(with request: CollectionModels.FetchFromLocalDataStore.Request)
    func fetchFromRemoteDataStore(with request: CollectionModels.FetchFromRemoteDataStore.Request)
    func trackAnalytics(with request: CollectionModels.TrackAnalytics.Request)
    func performCollection(with request: CollectionModels.PerformCollection.Request)
}

protocol CollectionDataStore {
    var exampleVariable: String? { get set }
}

class CollectionInteractor: CollectionBusinessLogic, CollectionDataStore {

    // MARK: - Properties

    typealias Models = CollectionModels

    lazy var worker = CollectionWorker()
    var presenter: CollectionPresentationLogic?

    var exampleVariable: String?

    // MARK: - Use Case - Fetch From Local DataStore

    func fetchFromLocalDataStore(with request: CollectionModels.FetchFromLocalDataStore.Request) {
        let response = Models.FetchFromLocalDataStore.Response()
        presenter?.presentFetchFromLocalDataStore(with: response)
    }

    // MARK: - Use Case - Fetch From Remote DataStore

    func fetchFromRemoteDataStore(with request: CollectionModels.FetchFromRemoteDataStore.Request) {
        // fetch something from backend and return the values here
        // <#Network Worker Instance#>.fetchFromRemoteDataStore(completion: { [weak self] code in
        //     let response = Models.FetchFromRemoteDataStore.Response(exampleVariable: code)
        //     self?.presenter?.presentFetchFromRemoteDataStore(with: response)
        // })
    }

    // MARK: - Use Case - Track Analytics

    func trackAnalytics(with request: CollectionModels.TrackAnalytics.Request) {
        // call analytics library/wrapper here to track analytics
        // <#Analytics Worker Instance#>.trackAnalytics(event: request.event)

        let response = Models.TrackAnalytics.Response()
        presenter?.presentTrackAnalytics(with: response)
    }

    // MARK: - Use Case - Collection

    func performCollection(with request: CollectionModels.PerformCollection.Request) {
        let error = worker.validate(exampleVariable: request.exampleVariable)

        if let error = error {
            let response = Models.PerformCollection.Response(error: error)
            presenter?.presentPerformCollection(with: response)
            return
        }

        // <#Network Worker Instance#>.performCollection(completion: { [weak self, weak request] isSuccessful, error in
        //     self?.completion(request?.exampleVariable, isSuccessful, error)
        // })
    }

    private func completion(_ exampleVariable: String?, _ isSuccessful: Bool, _ error: Models.CollectionError?) {
        if isSuccessful {
            // do something on success
            let goodExample = exampleVariable ?? ""
            self.exampleVariable = goodExample
        }

        let response = Models.PerformCollection.Response(error: error)
        presenter?.presentPerformCollection(with: response)
    }
}
