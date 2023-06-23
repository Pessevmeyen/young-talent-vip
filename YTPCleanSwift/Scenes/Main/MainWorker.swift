//
//  MainWorker.swift
//  YTPCleanSwift
//
//  Created by Furkan MobBook on 11.03.2023.
//

import Foundation

protocol MainWorkingLogic: AnyObject {
    func getData(request: GetRequest, completion: @escaping ((Result<OfficeData, Error>) -> Void))
}

final class MainWorker: MainWorkingLogic {
    // 3
    func getData(request: GetRequest, completion: @escaping ((Result<OfficeData, Error>) -> Void)) {
        NetworkManager.shared.fetch(request: request, encode: OfficeData.self, completion: completion)
    }
}
