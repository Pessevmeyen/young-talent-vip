//
//  DetailsInteractor.swift
//  YTPCleanSwift
//
//  Created by Furkan MobBook on 11.03.2023.
//

import Foundation

protocol DetailsBusinessLogic: AnyObject {
    func fetchDetails()
}

protocol DetailsDataStore: AnyObject {
    var officeData: Offices? { get set }
}

final class DetailsInteractor: DetailsBusinessLogic, DetailsDataStore {
    
    var presenter: DetailsPresentationLogic?
    var worker: DetailsWorkingLogic = DetailsWorker()
    var officeData: Offices?

    func fetchDetails() {
        presenter?.presentDetails(response: .init(officeDetail: officeData))
    }
}
