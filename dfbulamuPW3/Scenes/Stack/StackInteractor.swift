//
//  StackInteractor.swift
//  dfbulamuPW3
//
//  Created by Dilan Bulamu on 15.10.2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol StackBusinessLogic {
    func fetchFromLocalDataStore(with request: StackModels.FetchFromLocalDataStore.Request)
    func fetchFromRemoteDataStore(with request: StackModels.FetchFromRemoteDataStore.Request)
    func trackAnalytics(with request: StackModels.TrackAnalytics.Request)
    func performStack(with request: StackModels.PerformStack.Request)
}

protocol StackDataStore {
    var exampleVariable: String? { get set }
}

class StackInteractor: StackBusinessLogic, StackDataStore {

    // MARK: - Properties

    typealias Models = StackModels

    lazy var worker = StackWorker()
    var presenter: StackPresentationLogic?

    var exampleVariable: String?

    // MARK: - Use Case - Fetch From Local DataStore

    func fetchFromLocalDataStore(with request: StackModels.FetchFromLocalDataStore.Request) {
        let response = Models.FetchFromLocalDataStore.Response()
        presenter?.presentFetchFromLocalDataStore(with: response)
    }

    // MARK: - Use Case - Fetch From Remote DataStore

    func fetchFromRemoteDataStore(with request: StackModels.FetchFromRemoteDataStore.Request) {
        // fetch something from backend and return the values here
        // <#Network Worker Instance#>.fetchFromRemoteDataStore(completion: { [weak self] code in
        //     let response = Models.FetchFromRemoteDataStore.Response(exampleVariable: code)
        //     self?.presenter?.presentFetchFromRemoteDataStore(with: response)
        // })
    }

    // MARK: - Use Case - Track Analytics

    func trackAnalytics(with request: StackModels.TrackAnalytics.Request) {
        // call analytics library/wrapper here to track analytics
        // <#Analytics Worker Instance#>.trackAnalytics(event: request.event)

        let response = Models.TrackAnalytics.Response()
        presenter?.presentTrackAnalytics(with: response)
    }

    // MARK: - Use Case - Stack

    func performStack(with request: StackModels.PerformStack.Request) {
        let error = worker.validate(exampleVariable: request.exampleVariable)

        if let error = error {
            let response = Models.PerformStack.Response(error: error)
            presenter?.presentPerformStack(with: response)
            return
        }

        // <#Network Worker Instance#>.performStack(completion: { [weak self, weak request] isSuccessful, error in
        //     self?.completion(request?.exampleVariable, isSuccessful, error)
        // })
    }

    private func completion(_ exampleVariable: String?, _ isSuccessful: Bool, _ error: Models.StackError?) {
        if isSuccessful {
            // do something on success
            let goodExample = exampleVariable ?? ""
            self.exampleVariable = goodExample
        }

        let response = Models.PerformStack.Response(error: error)
        presenter?.presentPerformStack(with: response)
    }
}
