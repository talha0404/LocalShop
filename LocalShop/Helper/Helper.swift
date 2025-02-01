//
//  Helper.swift
//  LocalShop
//
//  Created by talha.sahin on 5.03.2024.
//

import Foundation
import UIKit

struct Helper {
   static func loadImage(from urlString: String, completion: @escaping (Result<UIImage, Error>) -> Void) {
            guard let imageUrl = URL(string: urlString) else {
                completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
                return
            }

            URLSession.shared.dataTask(with: imageUrl) { (data, response, error) in
                if let error = error {
                    completion(.failure(error))
                    return
                }

                guard let data = data, let image = UIImage(data: data) else {
                    completion(.failure(NSError(domain: "Failed to create UIImage from data", code: 0, userInfo: nil)))
                    return
                }

                completion(.success(image))
            }.resume()
        }
}
