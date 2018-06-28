//
//  ArticleDetailsPresenterProtocol.swift
//  NewsApp
//
//  Created by Pedro Contreras on 2018-06-27.
//  Copyright © 2018 Pedro Contreras. All rights reserved.
//

import Foundation

protocol ArticleDetailsPresenterProtocol:class {
    var interactor:ArticleDetailsInteractorProtocol? {get set}
    var view:ArticleDetailsViewProtocol? { get set }
    func fetchArticleDetails()
    func didReceiveArticleInformation(article:Article, error:String)
}
