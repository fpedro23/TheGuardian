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

class TheGuardianNetworkLayer:NetworkLayer, Reachable {
    
    let apiKey =  "e9228a65-1c50-4cb2-80d8-3b19a630cde5"
    let format = "json"
    let query = "international"
    let requestURL = "https://content.guardianapis.com/search"
    var parameters:Parameters { return ["api-key":self.apiKey,
                                      "format":self.format,
                                      "q":self.query,
                                      "page-size":20,
                                      "page":self.currentPage]
    }
    var reachabilityManager = NetworkReachabilityManager()
    var onReachabilityChangedBlock:(()->Void)?
    var currentPage:Int = 1
    init(){
        self.reachabilityManager?.listener = listener
        self.reachabilityManager?.startListening()
    }
    
    func listener(status:NetworkReachabilityManager.NetworkReachabilityStatus){
        switch status {
        case .reachable:
            self.onReachabilityChangedBlock?()
        default:
            print(":(")
        }
    }
    
    
    func fetchArticles(for date: Date, completion:@escaping ArticleFetchResultBlock) {
        Alamofire.request(requestURL, parameters:parameters).responseJSON{ response in
            if response.result.isSuccess {
                self.currentPage += 1
                if let results = ((response.result.value as? NSDictionary)?.object(forKey: "response") as? NSDictionary)?.object(forKey: "results") as? NSArray {
                    if let data = try? JSONSerialization.data(withJSONObject: results){
                        let jsonDecoder = JSONDecoder()
                        jsonDecoder.dateDecodingStrategy = .iso8601
                        if let articles = try? jsonDecoder.decode([TheGuardianArticle].self, from: data) {
                            DispatchQueue.main.async {
                                completion(articles, "")
                            }
                        }
                    }
                }
            }else {
                completion([], response.result.error.debugDescription)
            }
        }
    }
}
