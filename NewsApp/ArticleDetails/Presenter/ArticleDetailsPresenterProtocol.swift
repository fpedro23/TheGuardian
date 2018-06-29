//
//  ArticleDetailsPresenterProtocol.swift
//  NewsApp
//
//  Created by Pedro Contreras on 2018-06-27.
//  Copyright © 2018 Pedro Contreras. All rights reserved.
//

import Foundation

/// Article details presenter
protocol ArticleDetailsPresenterProtocol: class {

    /// Interactor
    var interactor: ArticleDetailsInteractorProtocol? {get set}

    /// View
    var view: ArticleDetailsViewProtocol? { get set }

    /// Fetches Article details
    func fetchArticleDetails()

    /// Called when new information is received from the interactor
    ///
    /// - Parameters:
    ///   - article: article
    ///   - error: error, empty if none
    func didReceiveArticleInformation(article: Article, error: String)
}
