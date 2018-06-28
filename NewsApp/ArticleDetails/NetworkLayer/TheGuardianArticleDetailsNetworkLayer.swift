//
//  TheGuardianArticleDetailsNetworkLayer.swift
//  NewsApp
//
//  Created by Pedro Contreras on 2018-06-27.
//  Copyright © 2018 Pedro Contreras. All rights reserved.
//

import Foundation
import Alamofire

class TheGuardianArticleDetailsNetworkLayer : ArticleDetailsNetworkLayerProtocol, Reachable {

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
            let results = ((response.result.value as! NSDictionary).object(forKey: "response") as! NSDictionary).object(forKey: "content") as! NSDictionary
            let jsonDecoder = JSONDecoder()
            let data = try! JSONSerialization.data(withJSONObject: results)
            jsonDecoder.dateDecodingStrategy = .iso8601
            let articles = try! jsonDecoder.decode(TheGuardianArticle.self, from: data)
            DispatchQueue.main.async {
                completion(articles)
            }
        }
    }
}
