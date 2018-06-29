//
//  PersistenceLayerProtocol.swift
//  NewsApp
//
//  Created by Pedro Contreras on 2018-06-28.
//  Copyright © 2018 Pedro Contreras. All rights reserved.
//

import Foundation


/// Persistence Layer Protocol
protocol PersistenceLayerProtocol {
    
    /// Saves the given article to the current context
    ///
    /// - Parameter article: article to persist
    func persistArticle(_ article:Article)
    
    /// Lists all the existing articles in the database
    ///
    /// - Returns: Array of Articles
    func fetchArticles() -> [Article]
    
    /// Fetch article with a given ID
    ///
    /// - Parameter id: id of Article
    /// - Returns: Article if found, Empty article if its not
    func fetchArticle(with id:String) -> Article
}
