//
//  NewYorkTimesNetworkLayer.swift
//  NewsApp
//
//  Created by Pedro Contreras on 2018-06-26.
//  Copyright © 2018 Pedro Contreras. All rights reserved.
//

import Foundation
import Alamofire

class TheGuardianNetworkLayer:NetworkLayer {
    
    let apiKey =  "e9228a65-1c50-4cb2-80d8-3b19a630cde5"
    let format = "json"
    let query = "international"
    let requestURL = "https://content.guardianapis.com/search"
    lazy var parameters:Parameters = ["api-key":self.apiKey,
                                      "format":self.format,
                                      "q":self.query
                                      ]
    
    
    func fetchArticles(for date: Date, completion:@escaping ArticleFetchResultBlock) {
        Alamofire.request(requestURL, parameters:parameters).responseJSON{ response in
            let results = ((response.result.value as! NSDictionary).object(forKey: "response") as! NSDictionary).object(forKey: "results") as! NSArray
            let jsonDecoder = JSONDecoder()
            let data = try! JSONSerialization.data(withJSONObject: results)
            jsonDecoder.dateDecodingStrategy = .iso8601
            let articles = try! jsonDecoder.decode([Article].self, from: data)
            DispatchQueue.main.async {
                completion(articles)
            }
        }
    }
}
