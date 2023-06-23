//
//  CleanPresenter.swift
//  YTPCleanSwift
//
//  Created by Furkan MobBook on 22.06.2023.
//

import Foundation

protocol CleanPresentationLogic: AnyObject {
    
}

final class CleanPresenter: CleanPresentationLogic {
    
    weak var viewController: CleanDisplayLogic?
    
}
