//
//  NetworkManager.swift
//  GitHubFollowers
//
//  Created by Gabryel Ferreira on 29/01/20.
//  Copyright © 2020 Gabryel Ferreira. All rights reserved.
//

import UIKit

class NetworkManager {
    
    static let shared = NetworkManager()
    private let baseUrl = "https://api.github.com/users/"
    let cache = NSCache<NSString, UIImage>()
    
    private init() {
    }
    
    func getFollowers(for username: String, page: Int, completion: @escaping (Result<[Follower], GFError>) -> Void) {
        let endpoint = baseUrl + "\(username)/followers?per_page=100&page=\(page)"
        guard let url = URL(string: endpoint) else {
            completion(.failure(.invalidUsername))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let _ = error {
                completion(.failure(.noInternetConnection))
            }
            
//            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
//                completion(nil, .serverResponseError)
//                return
//            }
            
            if let response = response as? HTTPURLResponse {
                if response.statusCode == 404 {
                    completion(.failure(.userNotFound))
                    return
                }
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completion(.success(followers))
            } catch {
                completion(.failure(.invalidData))
            }
            
        }
        
        task.resume()
    }
    
}
