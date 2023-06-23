//
//  DetailsModels.swift
//  YTPCleanSwift
//
//  Created by Furkan MobBook on 11.03.2023.
//

import Foundation

// swiftlint:disable nesting
enum Details {
    
    enum Fetch {
        
        struct Request {
            
        }
        
        struct Response {
            var officeDetail: Offices?
        }
        
        struct ViewModel {
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
// swiftlint:enable nesting
