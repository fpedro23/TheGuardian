//
//  TheGuardianArticleDetailsNetworkLayer.swift
//  NewsApp
//
//  Created by Pedro Contreras on 2018-06-27.
//  Copyright © 2018 Pedro Contreras. All rights reserved.
//

import Foundation
import Alamofire

class TheGuardianArticleDetailsNetworkLayer: ArticleDetailsNetworkLayerProtocol {

    var onReachabilityChangedBlock:(() -> Void)?
    let apiKey =  "e9228a65-1c50-4cb2-80d8-3b19a630cde5"
    var format = "json"
    let query = "international"
    let requestURL = "https://content.guardianapis.com/"
    lazy var parameters: Parameters = ["api-key": self.apiKey,
                                      "format": self.format,
                                      "show-fields": "body"
    ]

    func fetchDetailsFromArticle(_ article: Article, completion: @escaping (Article, String) -> Void) {
        Alamofire.request(requestURL + article.id, parameters: parameters).responseJSON { response in
            guard response.result.isSuccess else {
                completion(PersistedArticle(id: "", date: Date(), title: "", content: nil), response.result.error.debugDescription)
                return
            }

            guard let results = ((response.result.value as? NSDictionary)?.object(forKey: "response") as? NSDictionary)?.object(forKey: "content") as? NSDictionary else {
                completion(PersistedArticle(id: "", date: Date(), title: "", content: nil), "Keys not found in dictionary")
                return
            }

            guard let data = try? JSONSerialization.data(withJSONObject: results) else {
                return completion(PersistedArticle(id: "", date: Date(), title: "", content: nil), "No valid JSON Data")
            }

            let jsonDecoder = JSONDecoder()
            jsonDecoder.dateDecodingStrategy = .iso8601

            guard let articles = try? jsonDecoder.decode(TheGuardianArticle.self, from: data) else {
                return completion(PersistedArticle(id: "", date: Date(), title: "", content: nil), "Could not serialize model")
            }

            DispatchQueue.main.async {
                completion(articles, "")
            }
        }
    }
}
