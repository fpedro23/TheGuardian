//
//  ArticlesListInteractor.swift
//  NewsApp
//
//  Created by Pedro Contreras on 2018-06-26.
//  Copyright © 2018 Pedro Contreras. All rights reserved.
//

import Foundation


class ArticlesListInteractor {
    var networkLayer:NetworkLayer & Reachable
    var presenter:ArticlesListPresenter?
    
    init(networkLayer:NetworkLayer & Reachable) {
        self.networkLayer = networkLayer
        self.networkLayer.onReachabilityChangedBlock = reachabilityDidChange
    }
    
    func reachabilityDidChange(){
        if let presenter = self.presenter {
            self.fetchArticles(for: Date(), completion: presenter.didReceiveNewArticles)
        }
    }
    
    func fetchArticles(for date:Date, completion:@escaping ArticleFetchResultBlock){
        self.networkLayer.fetchArticles(for: date, completion: completion)
    }
}
