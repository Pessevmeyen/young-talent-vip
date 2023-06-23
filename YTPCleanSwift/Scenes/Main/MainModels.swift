//
//  OfficeModels.swift
//  Officer
//
//  Created by Furkan Eruçar on 1.08.2022.
//

import Foundation

// swiftlint:disable nesting
enum Office {
    
    enum Fetch {
        
        struct Request { // viewcontroller -> interactor
            let result: String
        }
        
        struct Response { // interactor -> Presenter
            var officeResponse: OfficeData
        }
        
        struct ViewModel { // presenter -> viewcontroller
            var officesListViewModel: [Office.Fetch.ViewModel.OfficeModel]

            struct OfficeModel {
                var id: Int?
                var image: String?
                var images: [String]?
                var name: String?
                var address: String?
                var capacity: String?
                var rooms: String?
                var space: String?
                var latitude: Double?
                var longitude: Double?
            }
        }
    }
}
