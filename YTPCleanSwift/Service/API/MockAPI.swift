//
//  MockAPI.swift
//  YTPCleanSwift
//
//
//

import UIKit

struct NetworkManager {
    
    static let shared = NetworkManager()
    let decoder = JSONDecoder()
    
    private init() {}
    
    func fetch<T: Codable>(request: GetRequest? ,encode model: T.Type, completion: @escaping ((Result<T, Error>) -> Void)) {
        guard let path = Bundle.main.path(forResource: "office-response", ofType: "json") else { return }
        let url = URL(fileURLWithPath: path)
        
        do {
            let data = try Data(contentsOf: url, options: .alwaysMapped)
            let json = try decoder.decode(model.self, from: data)
            print(json)
            completion(.success(json))
        } catch {
            completion(.failure(error.self))
        }
    }
}


