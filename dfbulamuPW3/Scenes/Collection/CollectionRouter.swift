//
//  CollectionRouter.swift
//  dfbulamuPW3
//
//  Created by Dilan Bulamu on 15.10.2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol CollectionRoutingLogic {
    func routeToNext()
}

protocol CollectionDataPassing {
    var dataStore: CollectionDataStore? { get }
}

class CollectionRouter: NSObject, CollectionRoutingLogic, CollectionDataPassing {

    // MARK: - Properties

    weak var viewController: CollectionViewController?
    var dataStore: CollectionDataStore?

    // MARK: - Routing

    func routeToNext() {
        // let destinationVC = UIStoryboard(name: "", bundle: nil).instantiateViewController(withIdentifier: "") as! NextViewController
        // var destinationDS = destinationVC.router!.dataStore!
        // passDataTo(destinationDS, from: dataStore!)
        // viewController?.navigationController?.pushViewController(destinationVC, animated: true)
    }

    // MARK: - Data Passing

    // func passDataTo(_ destinationDS: inout NextDataStore, from sourceDS: CollectionDataStore) {
    //     destinationDS.attribute = sourceDS.attribute
    // }
}
