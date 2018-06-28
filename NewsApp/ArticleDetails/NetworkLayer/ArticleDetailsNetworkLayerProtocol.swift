//
//  ArticleDetailsNetworkLayer.swift
//  NewsApp
//
//  Created by Pedro Contreras on 2018-06-27.
//  Copyright © 2018 Pedro Contreras. All rights reserved.
//

import Foundation

typealias ArticleDetailsFetchResultBlock = ((Article, String) -> Void)

protocol ArticleDetailsNetworkLayerProtocol {
    func fetchDetailsFromArticle(_ article:Article, completion: @escaping ArticleDetailsFetchResultBlock)
}
