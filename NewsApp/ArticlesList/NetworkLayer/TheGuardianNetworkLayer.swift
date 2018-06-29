//
//  NewYorkTimesNetworkLayer.swift
//  NewsApp
//
//  Created by Pedro Contreras on 2018-06-26.
//  Copyright © 2018 Pedro Contreras. All rights reserved.
//

import Foundation
import Alamofire
import Alamofire

class TheGuardianNetworkLayer:NetworkLayer {
    
    let apiKey =  "e9228a65-1c50-4cb2-80d8-3b19a630cde5"
    var format = "json"
    var query = "international"
    var requestURL = "https://content.guardianapis.com/search"
    var parameters:Parameters { return ["api-key":self.apiKey,
                                        "format":self.format,
                                        "q":self.query,
                                        "page-size":20,
                                        "page":self.currentPage]
    }
    var currentPage:Int = 1
    
    func fetchArticles(for date: Date, completion:@escaping ArticleFetchResultBlock) {
        Alamofire.request(requestURL, parameters:parameters).responseJSON{ response in
            guard response.result.isSuccess else {
                return  completion([], response.result.error.debugDescription)
            }
            
            self.currentPage += 1
            
            guard let results = ((response.result.value as? NSDictionary)?.object(forKey: "response") as? NSDictionary)?.object(forKey: "results") as? NSArray else {
                return  completion([], "Keys not found in dictionary")
            }
            
            guard let data = try? JSONSerialization.data(withJSONObject: results) else {
                return  completion([], "No valid JSON Data")
            }
            let jsonDecoder = JSONDecoder()
            jsonDecoder.dateDecodingStrategy = .iso8601
            guard let articles = try? jsonDecoder.decode([TheGuardianArticle].self, from: data) else {
                return  completion([], "Could not serialize json to model")
                
            }
            
            DispatchQueue.main.async {
                completion(articles, "")
            }
        }
    }
}
