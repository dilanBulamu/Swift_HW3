//
//  TableInteractor.swift
//  dfbulamuPW3
//
//  Created by Dilan Bulamu on 15.10.2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol TableBusinessLogic {
    func fetchFromLocalDataStore(with request: TableModels.FetchFromLocalDataStore.Request)
    func fetchFromRemoteDataStore(with request: TableModels.FetchFromRemoteDataStore.Request)
    func trackAnalytics(with request: TableModels.TrackAnalytics.Request)
    func performTable(with request: TableModels.PerformTable.Request)
}

protocol TableDataStore {
    var exampleVariable: String? { get set }
}

class TableInteractor: TableBusinessLogic, TableDataStore {

    // MARK: - Properties

    typealias Models = TableModels

    lazy var worker = TableWorker()
    var presenter: TablePresentationLogic?

    var exampleVariable: String?

    // MARK: - Use Case - Fetch From Local DataStore

    func fetchFromLocalDataStore(with request: TableModels.FetchFromLocalDataStore.Request) {
        let response = Models.FetchFromLocalDataStore.Response()
        presenter?.presentFetchFromLocalDataStore(with: response)
    }

    // MARK: - Use Case - Fetch From Remote DataStore

    func fetchFromRemoteDataStore(with request: TableModels.FetchFromRemoteDataStore.Request) {
        // fetch something from backend and return the values here
        // <#Network Worker Instance#>.fetchFromRemoteDataStore(completion: { [weak self] code in
        //     let response = Models.FetchFromRemoteDataStore.Response(exampleVariable: code)
        //     self?.presenter?.presentFetchFromRemoteDataStore(with: response)
        // })
    }

    // MARK: - Use Case - Track Analytics

    func trackAnalytics(with request: TableModels.TrackAnalytics.Request) {
        // call analytics library/wrapper here to track analytics
        // <#Analytics Worker Instance#>.trackAnalytics(event: request.event)

        let response = Models.TrackAnalytics.Response()
        presenter?.presentTrackAnalytics(with: response)
    }

    // MARK: - Use Case - Table

    func performTable(with request: TableModels.PerformTable.Request) {
        let error = worker.validate(exampleVariable: request.exampleVariable)

        if let error = error {
            let response = Models.PerformTable.Response(error: error)
            presenter?.presentPerformTable(with: response)
            return
        }

        // <#Network Worker Instance#>.performTable(completion: { [weak self, weak request] isSuccessful, error in
        //     self?.completion(request?.exampleVariable, isSuccessful, error)
        // })
    }

    private func completion(_ exampleVariable: String?, _ isSuccessful: Bool, _ error: Models.TableError?) {
        if isSuccessful {
            // do something on success
            let goodExample = exampleVariable ?? ""
            self.exampleVariable = goodExample
        }

        let response = Models.PerformTable.Response(error: error)
        presenter?.presentPerformTable(with: response)
    }
}
