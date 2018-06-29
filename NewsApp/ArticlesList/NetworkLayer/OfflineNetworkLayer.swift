//
//  OfflineNetworkLayer.swift
//  NewsApp
//
//  Created by Pedro Contreras on 2018-06-26.
//  Copyright © 2018 Pedro Contreras. All rights reserved.
//

import Foundation

class OfflineNetworkLayer: NetworkLayer {

    let content = """
Lorem ipsum dolor sit amet, consectetur adipiscing elit,
sed do  eiusmod tempor incididunt ut labore et dolore magna aliqua.
Ut enim ad minim veniam,
quis nostrud exercitation
ullamco laboris nisi ut aliquip ex ea commodo consequat.
Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
Excepteur sint occaecat cupidatat non proident,
sunt in culpa qui officia deserunt mollit anim id est laborum.
"""

    var articles: [Article] = []

    init(numberOfArticles: Int) {
        for counter in 0..<numberOfArticles {
            var components =  Calendar.current.dateComponents([.year, .day, .month], from: Date())
            components.day = components.day! - counter
            let date = Calendar.current.date(from: components)!
            let article = PersistedArticle(date: date,
                                  title: "\(counter) \(content)",

                content: content)
            articles.append(article)
        }
    }

    func fetchArticles(for date: Date, completion:@escaping ArticleFetchResultBlock) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                completion(self.articles, "")
        }
    }
}
