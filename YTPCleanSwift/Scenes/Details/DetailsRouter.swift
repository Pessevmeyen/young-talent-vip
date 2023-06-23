//
//  DetailsRouter.swift
//  YTPCleanSwift
//
//  Created by Furkan MobBook on 11.03.2023.
//

import Foundation

protocol DetailsRoutingLogic: AnyObject {
    
}

protocol DetailsDataPassing: class {
    var dataStore: DetailsDataStore? { get }
}

final class DetailsRouter: DetailsRoutingLogic, DetailsDataPassing {
    
    weak var viewController: DetailsViewController?
    var dataStore: DetailsDataStore?
    
}
