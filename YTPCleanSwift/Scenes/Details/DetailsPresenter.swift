//
//  DetailsPresenter.swift
//  YTPCleanSwift
//
//  Created by Furkan MobBook on 11.03.2023.
//

import Foundation

protocol DetailsPresentationLogic: AnyObject {
    func presentDetails(response: Details.Fetch.Response)
}

final class DetailsPresenter: DetailsPresentationLogic {
    
    weak var viewController: DetailsDisplayLogic?

    func presentDetails(response: Details.Fetch.Response) {
        let details: Details.Fetch.ViewModel = .init(
            id: response.officeDetail?.id,
            image: response.officeDetail?.image,
            images: response.officeDetail?.images,
            name: response.officeDetail?.name,
            address: response.officeDetail?.address,
            capacity: response.officeDetail?.capacity,
            rooms: String(response.officeDetail?.rooms ?? 0),
            space: response.officeDetail?.space,
            latitude: response.officeDetail?.location?.latitude,
            longitude: response.officeDetail?.location?.longitude
        )
        viewController?.displayDetails(viewModel: details)
    }
}
