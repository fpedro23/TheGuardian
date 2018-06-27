//
//  ArticlesListInteractor.swift
//  NewsApp
//
//  Created by Pedro Contreras on 2018-06-26.
//  Copyright © 2018 Pedro Contreras. All rights reserved.
//

import Foundation


class ArticlesListInteractor {
    var networkLayer:NetworkLayer
    var presenter:ArticlesListPresenter?
    
    init(networkLayer:NetworkLayer) {
        self.networkLayer = networkLayer
    }
    
    func fetchArticles(for date:Date, completion:@escaping ArticleFetchResultBlock){
        self.networkLayer.fetchArticles(for: date, completion: completion)
    }
}
