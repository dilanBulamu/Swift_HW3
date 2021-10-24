//
//  StackRouter.swift
//  dfbulamuPW3
//
//  Created by Dilan Bulamu on 15.10.2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol StackRoutingLogic {
    func routeToNext()
}

protocol StackDataPassing {
    var dataStore: StackDataStore? { get }
}

class StackRouter: NSObject, StackRoutingLogic, StackDataPassing {

    // MARK: - Properties

    weak var viewController: StackViewController?
    var dataStore: StackDataStore?

    // MARK: - Routing

    func routeToNext() {
        // let destinationVC = UIStoryboard(name: "", bundle: nil).instantiateViewController(withIdentifier: "") as! NextViewController
        // var destinationDS = destinationVC.router!.dataStore!
        // passDataTo(destinationDS, from: dataStore!)
        // viewController?.navigationController?.pushViewController(destinationVC, animated: true)
    }

    // MARK: - Data Passing

    // func passDataTo(_ destinationDS: inout NextDataStore, from sourceDS: StackDataStore) {
    //     destinationDS.attribute = sourceDS.attribute
    // }
}
