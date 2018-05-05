//
//  App.swift
//  OldAppStore
//
//  Created by Руслан Акберов on 05.05.2018.
//  Copyright © 2018 Ruslan Akberov. All rights reserved.
//

import Foundation

struct App: Decodable {
    var id: Int?
    var name: String?
    var category: String?
    var imageName: String?
    var price: Double?
    
    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case name = "Name"
        case category = "Category"
        case imageName = "ImageName"
        case price = "Price"
    }
}
