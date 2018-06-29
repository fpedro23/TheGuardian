//
//  ArticleDetailsWireframe.swift
//  NewsApp
//
//  Created by Pedro Contreras on 2018-06-27.
//  Copyright © 2018 Pedro Contreras. All rights reserved.
//

import Foundation
import UIKit

class ArticleDetailsWireframe {
    public var view: (UIViewController & ArticleDetailsViewProtocol)?
    weak public var presenter: ArticleDetailsPresenterProtocol?
    public var interactorType: ArticleDetailsInteractorProtocol.Type = ArticleDetailsInteractor.self
    public var articleDetailsViewType: (UIViewController & ArticleDetailsViewProtocol).Type = ArticleDetailsViewController.self

    func mainViewController(article: Article) -> UIViewController {
        var interactor = interactorType.init(networkLayer: TheGuardianArticleDetailsNetworkLayer())
        interactor.persistenceLayer = CoreDataStack()
        let view = self.createNewArticleDetailsView()
        let presenter = ArticleDetailsPresenter()
        presenter.interactor = interactor
        presenter.wireframe = self
        presenter.view = view
        interactor.presenter = presenter
        interactor.article = article
        view.eventHandler = presenter
        self.presenter = presenter

        return view
    }

    public func createNewArticleDetailsView() -> (UIViewController & ArticleDetailsViewProtocol) {
        let view = articleDetailsViewType.init()
        self.view = view
        return view
    }
}
