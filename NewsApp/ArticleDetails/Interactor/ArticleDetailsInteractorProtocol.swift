//
//  ArticleDetailsInteractorProtocol.swift
//  NewsApp
//
//  Created by Pedro Contreras on 2018-06-27.
//  Copyright © 2018 Pedro Contreras. All rights reserved.
//

import Foundation

protocol ArticleDetailsInteractorProtocol {

    init(networkLayer: ArticleDetailsNetworkLayerProtocol)
    var presenter: ArticleDetailsPresenterProtocol? { get set }
    var article: Article? { get set }
    var persistenceLayer: PersistenceLayerProtocol? {get set}

    func fetchArticleDetails(completion: @escaping ArticleDetailsFetchResultBlock)
}
