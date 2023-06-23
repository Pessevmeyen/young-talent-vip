//
//  CleanInteractor.swift
//  YTPCleanSwift
//
//  Created by Furkan MobBook on 22.06.2023.
//

import Foundation

protocol CleanBusinessLogic: AnyObject {
    
}

protocol CleanDataStore: AnyObject {
    
}

final class CleanInteractor: CleanBusinessLogic, CleanDataStore {
    
    var presenter: CleanPresentationLogic?
    var worker: CleanWorkingLogic = CleanWorker()
    
}
