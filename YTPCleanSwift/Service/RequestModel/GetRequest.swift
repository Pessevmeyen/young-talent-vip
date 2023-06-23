//
//  GetRequest.swift
//  YTPCleanSwift
//
//  Created by Furkan MobBook on 12.03.2023.
//

import Foundation

struct GetRequest: Encodable {
    var result: String?
    
    init(result: String) {
        self.result = result
    }
}
