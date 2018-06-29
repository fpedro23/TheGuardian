//
//  OfflineArticleDetailsNetworkLayer.swift
//  NewsApp
//
//  Created by Pedro Contreras on 2018-06-27.
//  Copyright © 2018 Pedro Contreras. All rights reserved.
//

import Foundation

class OfflineArticleDetailsNetworkLayer: ArticleDetailsNetworkLayerProtocol {

    func fetchDetailsFromArticle(_ article: Article, completion: @escaping (Article, String) -> Void) {
        let expectedOnlineArticle: Article = PersistedArticle(id: "1", date: Date(), title: "Test Online Article", content: "")
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            completion(expectedOnlineArticle, "")
        }
    }
}
