//
//  UIImage+Ext.swift
//  GitHubFollowers
//
//  Created by Gabryel Ferreira on 31/01/20.
//  Copyright © 2020 Gabryel Ferreira. All rights reserved.
//

import UIKit

extension UIImage {
    
    static func downloadImage(from urlString: String, completion: @escaping (_ image: UIImage) -> ()) {
        let cache = NetworkManager.shared.cache
        let cacheKey = NSString(string: urlString)
        if let image = cache.object(forKey: cacheKey) {
            completion(image)
            return
        }
        
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil { return }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
            guard let data = data else { return }
            guard let image = UIImage(data: data) else { return }
            cache.setObject(image, forKey: cacheKey)
            DispatchQueue.main.async {
                completion(image)
            }
            
            
        }
        task.resume()
    }
    
}
