//
//  MockedPersistenceStore.swift
//  NewsApp
//
//  Created by Pedro Contreras on 2018-06-28.
//  Copyright © 2018 Pedro Contreras. All rights reserved.
//

import Foundation

class MockPersistenceStore : PersistenceLayerProtocol {
    
    var articles:[Article] = []
    
    init(numberOfArticles:Int){
        for _ in 0..<numberOfArticles {
            let article = PersistedArticle(id: UUID().uuidString, date: Date(), title: "Test Persisted Article", content: "Test Content")
            articles.append(article)
        }
    }
    
    func persistArticle(_ article: Article) {
        print("Persist article")
    }
    
    func fetchArticles() -> [Article] {
        return articles
    }
    
    func fetchArticle(with id: String) -> Article {
        return articles.first(where: {$0.id == id})!
    }
    
    
}
