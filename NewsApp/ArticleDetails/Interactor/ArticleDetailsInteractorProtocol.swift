//
//  ArticleDetailsInteractorProtocol.swift
//  NewsApp
//
//  Created by Pedro Contreras on 2018-06-27.
//  Copyright © 2018 Pedro Contreras. All rights reserved.
//

import Foundation

/// Article Details Interactor
protocol ArticleDetailsInteractorProtocol {

    /// Initializes an interactor
    ///
    /// - Parameter networkLayer: network layer
    init(networkLayer: ArticleDetailsNetworkLayerProtocol)

    /// Presenter
    var presenter: ArticleDetailsPresenterProtocol? { get set }

    /// Article
    var article: Article? { get set }

    /// Persistence Layer
    var persistenceLayer: PersistenceLayerProtocol? {get set}

    /// Called when new article information is fetched from the network layer
    ///
    /// - Parameter completion: completion
    func fetchArticleDetails(completion: @escaping ArticleDetailsFetchResultBlock)
}
