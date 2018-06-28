//
//  PersistenceLayerProtocol.swift
//  NewsApp
//
//  Created by Pedro Contreras on 2018-06-28.
//  Copyright © 2018 Pedro Contreras. All rights reserved.
//

import Foundation

protocol PersistenceLayerProtocol {
    func persistArticle(_ article:Article)
    func fetchArticles() -> [Article]
    func fetchArticle(with id:String) -> Article
}
