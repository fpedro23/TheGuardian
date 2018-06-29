//
//  ArticleListInteractorProtocol.swift
//  NewsApp
//
//  Created by Pedro Contreras on 2018-06-28.
//  Copyright © 2018 Pedro Contreras. All rights reserved.
//

import Foundation

protocol ArticlesListInteractorProtocol {

    /// Network Layer
    var networkLayer: NetworkLayer {get set}

    /// Persistence Layer
    var persistenceLayer: PersistenceLayerProtocol? {get set}

    /// Presenter
    var presenter: ArticlesListPresenterProtocol? {get set}

    /// Initializes interactor with the given network layer
    ///
    /// - Parameter networkLayer: network layer
    init(networkLayer: NetworkLayer)

    /// Fetch articles from the network layer
    ///
    /// - Parameters:
    ///   - date: date to fetch articles
    ///   - completion: completion block
    func fetchArticles(for date: Date, completion:@escaping ArticleFetchResultBlock)
}
