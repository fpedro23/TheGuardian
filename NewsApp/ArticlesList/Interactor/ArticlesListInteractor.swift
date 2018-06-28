//
//  ArticlesListInteractor.swift
//  NewsApp
//
//  Created by Pedro Contreras on 2018-06-26.
//  Copyright © 2018 Pedro Contreras. All rights reserved.
//

import Foundation
import Alamofire

class ArticlesListInteractor {
    var networkLayer:NetworkLayer
    var persistenceLayer:PersistenceLayerProtocol?
    var presenter:ArticlesListPresenter?
    var reachabilityManager = NetworkReachabilityManager()
    var isReachable = false
    
    init(networkLayer:NetworkLayer) {
        self.networkLayer = networkLayer
        //self.networkLayer.onReachabilityChangedBlock = reachabilityDidChange
        self.reachabilityManager?.listener = listener
        self.reachabilityManager?.startListening()
        self.isReachable = self.reachabilityManager?.isReachable ?? false
    
    }
    
    func listener(status:NetworkReachabilityManager.NetworkReachabilityStatus){
        switch status {
        case .reachable:
            if self.isReachable { return }
            self.isReachable = true
            self.reachabilityDidChange()
        default:
            self.isReachable = false
            print("Status did change :\(status)")
        }
    }
    
    func reachabilityDidChange(){
        if let presenter = self.presenter {
            self.fetchArticles(for: Date()){ articles, error in
             presenter.didReceiveNewArticles(articles: articles, error: error, replace: false)
            }
        }
    }
    
    func didReceiveArticles(articles:[Article], error:String){
        if !error.isEmpty { return }
        articles.forEach{self.persistenceLayer?.persistArticle($0)}
    }
    
    func fetchArticles(for date:Date, completion:@escaping ArticleFetchResultBlock){
        if self.isReachable {
            self.networkLayer.fetchArticles(for: date){ articles, error in
                    self.didReceiveArticles(articles: articles, error: error)
                    completion(articles, error)
            }
        }else{
            completion(self.persistenceLayer?.fetchArticles() ?? [], "")
        }
    }
}

