//
//  MainInteractor.swift
//  YTPCleanSwift
//
//  Created by Furkan MobBook on 11.03.2023.
//

import Foundation

protocol MainBusinessLogic: AnyObject {
    func fetchData(request: Office.Fetch.Request)
}

protocol MainDataStore: AnyObject {
    var officeData: OfficeData? { get set }
}

final class MainInteractor: MainBusinessLogic, MainDataStore {
    
    var presenter: MainPresentationLogic?
    var worker: MainWorkingLogic = MainWorker()
    var officeData: OfficeData?
    

    func fetchData(request: Office.Fetch.Request) {
        // 2
        worker.getData(request: GetRequest(result: request.result)) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let response):
                self.officeData = response
                guard let officeData = self.officeData else { return }
                // 4
                presenter?.presentOffices(response: .init(officeResponse: officeData))
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
