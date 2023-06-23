//
//  GetResponse.swift
//  YTPCleanSwift
//
//  Created by Furkan MobBook on 11.03.2023.
//

import Foundation

// MARK: - Offices
public struct OfficeData: Codable {
    public let offices: [Offices]?
}

// MARK: - Office
public struct Offices: Codable {
    public let address, capacity: String?
    public let id: Int?
    public let image: String?
    public let images: [String]?
    public let location: Location?
    public let name: String?
    public let rooms: Int?
    public let space: String?
}

// MARK: - Location
public struct Location: Codable {
    public let latitude, longitude: Double?
}
