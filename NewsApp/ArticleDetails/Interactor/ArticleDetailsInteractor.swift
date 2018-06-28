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
    var networkLayer:ArticleDetailsNetworkLayerProtocol & Reachable
    var presenter: ArticleDetailsPresenterProtocol?
    
    required init(networkLayer: ArticleDetailsNetworkLayerProtocol & Reachable) {
        self.networkLayer = networkLayer
        self.networkLayer.onReachabilityChangedBlock = reachabilityDidChange
    }
    
    func reachabilityDidChange(){
        guard let article = self.article else { return }
        guard let presenter = self.presenter else { return }
        self.networkLayer.fetchDetailsFromArticle(article, completion: presenter.didReceiveArticleInformation)
    }
    
    func fetchArticleDetails(completion: @escaping ArticleDetailsFetchResultBlock){
        guard let article = self.article else { return }
        self.networkLayer.fetchDetailsFromArticle(article, completion: completion)
    }
    
}
