//
//  AppCategory.swift
//  OldAppStore
//
//  Created by Руслан Акберов on 05.05.2018.
//  Copyright © 2018 Ruslan Akberov. All rights reserved.
//

import Foundation

struct Categories: Decodable {
    var categories: [AppCategory]?
}

struct AppCategory: Decodable {
    var name: String?
    var type: String?
    var apps: [App]?
    
    static func fetchFeaturedApps(completion: @escaping ([AppCategory]) -> Void) {
        let urlString = "https://api.letsbuildthatapp.com/appstore/featured"
        let session = URLSession.shared.dataTask(with: URL(string: urlString)!) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            do {
                let decodedCategories = try JSONDecoder().decode(Categories.self, from: data!)
                DispatchQueue.main.async {
                    completion(decodedCategories.categories!)
                }
            } catch let error{
                print(error.localizedDescription)
            }
        }
        session.resume()
    }
    
}










