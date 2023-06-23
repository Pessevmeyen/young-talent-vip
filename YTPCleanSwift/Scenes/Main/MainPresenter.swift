//
//  MainPresenter.swift
//  YTPCleanSwift
//
//  Created by Furkan MobBook on 11.03.2023.
//

import Foundation

protocol MainPresentationLogic: AnyObject {
    func presentOffices(response: Office.Fetch.Response)
}

final class MainPresenter: MainPresentationLogic {
    
    weak var viewController: MainDisplayLogic?

    func presentOffices(response: Office.Fetch.Response) {
        var offices: [Office.Fetch.ViewModel.OfficeModel] = []
        response.officeResponse.offices?.forEach {
            offices.append(
                Office.Fetch.ViewModel.OfficeModel(
                    id: $0.id,
                    image: $0.image,
                    images: $0.images,
                    name: $0.name,
                    address: $0.address,
                    capacity: $0.capacity,
                    rooms: String($0.rooms ?? 0),
                    space: $0.space,
                    latitude: $0.location?.latitude,
                    longitude: $0.location?.longitude
                )
            )
        }
        // 5
        
        viewController?.displayOffices(viewModel: .init(officesListViewModel: offices))
    }
}
