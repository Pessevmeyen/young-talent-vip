//
//  MainRouter.swift
//  YTPCleanSwift
//
//  Created by Furkan MobBook on 11.03.2023.
//

import UIKit

protocol MainRoutingLogic: AnyObject {
    func routeToDetail(index: Int)
}

protocol MainDataPassing: AnyObject {
    var dataStore: MainDataStore? { get }
}

final class MainRouter: MainRoutingLogic, MainDataPassing {
    
    weak var viewController: MainViewController?
    var dataStore: MainDataStore?
    // 5
    func routeToDetail(index: Int) {
        let storyboard = UIStoryboard(name: "Details", bundle: nil)
        let destinationVC: DetailsViewController = storyboard.instantiateViewController(identifier: "DetailsViewController")
        destinationVC.router?.dataStore?.officeData = dataStore?.officeData?.offices?[index]
        viewController?.present(destinationVC, animated: true)
    }
    
}
