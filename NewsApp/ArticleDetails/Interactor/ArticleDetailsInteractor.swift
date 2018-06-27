//
//  ArticleDetailsInteractor.swift
//  NewsApp
//
//  Created by Pedro Contreras on 2018-06-27.
//  Copyright © 2018 Pedro Contreras. All rights reserved.
//

import Foundation

class ArticleDetailsInteractor : ArticleDetailsInteractorProtocol {
    
    var article: Article?
    var networkLayer:ArticleDetailsNetworkLayerProtocol
    var presenter: ArticleDetailsPresenterProtocol?
    
    required init(networkLayer: ArticleDetailsNetworkLayerProtocol) {
        self.networkLayer = networkLayer
    }
    
    func fetchArticleDetails(completion: @escaping ArticleDetailsFetchResultBlock){
        guard let article = self.article else { return }
        self.networkLayer.fetchDetailsFromArticle(article, completion: completion)
    }
    
}
