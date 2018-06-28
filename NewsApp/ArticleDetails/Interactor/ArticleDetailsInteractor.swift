//
//  ArticleDetailsInteractor.swift
//  NewsApp
//
//  Created by Pedro Contreras on 2018-06-27.
//  Copyright © 2018 Pedro Contreras. All rights reserved.
//

import Foundation
import Alamofire

class ArticleDetailsInteractor : ArticleDetailsInteractorProtocol {
    
    var article: Article?
    var networkLayer:ArticleDetailsNetworkLayerProtocol
    var presenter: ArticleDetailsPresenterProtocol?
    var persistenceLayer:PersistenceLayerProtocol?
    var reachabilityManager = NetworkReachabilityManager()
    var isReachable = false

    required init(networkLayer: ArticleDetailsNetworkLayerProtocol) {
        self.networkLayer = networkLayer
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
        guard let presenter = self.presenter else { return }
        self.fetchArticleDetails(completion: presenter.didReceiveArticleInformation)
    }
    
    func didReceiveArticle(article:Article){
        self.persistenceLayer?.persistArticle(article)
    }
    
    func fetchArticleDetails(completion: @escaping ArticleDetailsFetchResultBlock){
        guard let article = self.article else { return }
        if self.isReachable {
            self.networkLayer.fetchDetailsFromArticle(article){ article, error  in
                self.didReceiveArticle(article: article)
                completion(article, error)
            }
        }else{
            completion(self.persistenceLayer?.fetchArticle(with: article.id) ?? PersistedArticle(id: "the id", date: Date(), title: "mE TRU", content: "cONTENT"), "")
        }
        
    }
    
}
