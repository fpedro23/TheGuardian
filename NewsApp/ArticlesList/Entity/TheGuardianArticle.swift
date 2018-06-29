//
//  Article.swift
//  NewsApp
//
//  Created by Pedro Contreras on 2018-06-26.
//  Copyright © 2018 Pedro Contreras. All rights reserved.
//

import Foundation

/// The Guardian Article
class TheGuardianArticle: Codable, Article {
    var id: String
    var title: String
    var date: Date
    var content: String?

    /// Required initializer for creating instance from JSON
    ///
    /// - Parameter decoder: decoder
    /// - Throws: exception if decoding error
    required init(from decoder: Decoder)  throws {
        let rawResponse = try RawServerResponse(from: decoder)
        self.id = rawResponse.id
        self.title = rawResponse.webTitle
        self.date = rawResponse.webPublicationDate
        self.content = rawResponse.fields?["body"] ?? ""
    }

    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "webTitle"
        case date = "webPublicationDate"
    }
}

/// Helper type to parse nested fields inside JSON
private struct RawServerResponse: Decodable {

    var id: String
    var webTitle: String
    var webPublicationDate: Date
    var fields: [String: String]?
}
