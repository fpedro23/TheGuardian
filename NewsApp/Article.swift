//
//  Article.swift
//  NewsApp
//
//  Created by Pedro Contreras on 2018-06-26.
//  Copyright © 2018 Pedro Contreras. All rights reserved.
//

import Foundation

class Article:Codable {
    var id:String
    var title:String
    var date:Date
    var image:URL?
    var content:String?
    
    init(id:String = UUID().uuidString, date:Date = Date(), title:String, image:URL?, content:String?) {
        self.id = id
        self.date = date
        self.title = title
        self.image = image
        self.content = content
    }
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "webTitle"
        case date = "webPublicationDate"
        case image
        case content
    }
}
