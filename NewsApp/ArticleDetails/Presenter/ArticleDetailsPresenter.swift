//
//  ArticleDetailsPresenter.swift
//  NewsApp
//
//  Created by Pedro Contreras on 2018-06-27.
//  Copyright © 2018 Pedro Contreras. All rights reserved.
//

import Foundation

class ArticleDetailsPresenter : ArticleDetailsPresenterProtocol {
    var interactor:ArticleDetailsInteractorProtocol?
    weak var wireframe:ArticleDetailsWireframe?
    weak var view:ArticleDetailsViewProtocol?
    let dateformatter:DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()
    
    func didReceiveArticleInformation(article:Article){
        self.view?.setTitle(article.title)
        self.view?.setDate(dateformatter.string(from: article.date))
        self.view?.setBody(article.content ?? "")
    }
    
    func fetchArticleDetails(){
        self.interactor?.fetchArticleDetails(completion: self.didReceiveArticleInformation)
    }
    
}
