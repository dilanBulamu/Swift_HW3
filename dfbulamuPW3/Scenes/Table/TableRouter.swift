//
//  TableRouter.swift
//  dfbulamuPW3
//
//  Created by Dilan Bulamu on 15.10.2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol TableRoutingLogic {
    func routeToNext()
}

protocol TableDataPassing {
    var dataStore: TableDataStore? { get }
}

class TableRouter: NSObject, TableRoutingLogic, TableDataPassing {

    // MARK: - Properties

    weak var viewController: TableViewController?
    var dataStore: TableDataStore?

    // MARK: - Routing

    func routeToNext() {
        // let destinationVC = UIStoryboard(name: "", bundle: nil).instantiateViewController(withIdentifier: "") as! NextViewController
        // var destinationDS = destinationVC.router!.dataStore!
        // passDataTo(destinationDS, from: dataStore!)
        // viewController?.navigationController?.pushViewController(destinationVC, animated: true)
    }

    // MARK: - Data Passing

    // func passDataTo(_ destinationDS: inout NextDataStore, from sourceDS: TableDataStore) {
    //     destinationDS.attribute = sourceDS.attribute
    // }
}
