//
//  MockedPersistenceStore.swift
//  NewsApp
//
//  Created by Pedro Contreras on 2018-06-28.
//  Copyright © 2018 Pedro Contreras. All rights reserved.
//

import Foundation


/// Mock Class for persistence layer, useful for Unit Testing
class MockPersistenceStore : PersistenceLayerProtocol {
    
    /// Mock articles for store
    var articles:[Article] = []
    

    /// Initialize the store with the given number of articles
    ///
    /// - Parameter numberOfArticles: number of articles to create
    init(numberOfArticles:Int){
        for _ in 0..<numberOfArticles {
            let article = PersistedArticle(id: UUID().uuidString, date: Date(), title: "Test Persisted Article", content: "Test Content")
            articles.append(article)
        }
    }
    
    /// Saves the given article to the current context
    ///
    /// - Parameter article: article to persist
    func persistArticle(_ article: Article) {
        print("Persist article")
    }
    
    /// Lists all the existing articles in the database
    ///
    /// - Returns: Array of Articles
    func fetchArticles() -> [Article] {
        return articles
    }

    /// Fetch article with a given ID
    ///
    /// - Parameter id: id of Article
    /// - Returns: Article if found, Empty article if its not
    func fetchArticle(with id: String) -> Article {
        return articles.first(where: {$0.id == id})!
    }
    
}
