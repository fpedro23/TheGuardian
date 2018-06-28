//
//  TheGuardianArticleDetailsNetworkLayer.swift
//  NewsApp
//
//  Created by Pedro Contreras on 2018-06-27.
//  Copyright © 2018 Pedro Contreras. All rights reserved.
//

import Foundation
import Alamofire

class TheGuardianArticleDetailsNetworkLayer : ArticleDetailsNetworkLayerProtocol {

    var onReachabilityChangedBlock:(()->Void)? 
    let apiKey =  "e9228a65-1c50-4cb2-80d8-3b19a630cde5"
    let format = "json"
    let query = "international"
    let requestURL = "https://content.guardianapis.com/"
    lazy var parameters:Parameters = ["api-key":self.apiKey,
                                      "format":self.format,
                                      "show-fields":"body"
    ]
    

    func fetchDetailsFromArticle(_ article: Article, completion: @escaping (Article) -> Void) {
        Alamofire.request(requestURL + article.id, parameters:parameters).responseJSON{ response in
            guard response.result.isSuccess else {
                return
            }
            
            guard let results = ((response.result.value as? NSDictionary)?.object(forKey: "response") as? NSDictionary)?.object(forKey: "content") as? NSDictionary else { return
            }
            
            guard let data = try? JSONSerialization.data(withJSONObject: results) else {
                return
            }
            
            let jsonDecoder = JSONDecoder()
            jsonDecoder.dateDecodingStrategy = .iso8601

            guard let articles = try? jsonDecoder.decode(TheGuardianArticle.self, from: data) else {
                return
            }
            
            DispatchQueue.main.async {
                completion(articles)
            }
        }
    }
}
