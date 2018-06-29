//
//  ArticleDetailsWireframe.swift
//  NewsApp
//
//  Created by Pedro Contreras on 2018-06-27.
//  Copyright © 2018 Pedro Contreras. All rights reserved.
//

import Foundation
import UIKit

/// Manages VIPER module creation for article details
class ArticleDetailsWireframe {

    /// View
    public var view: (UIViewController & ArticleDetailsViewProtocol)?

    /// Presenter
    weak public var presenter: ArticleDetailsPresenterProtocol?

    /// Interactor
    public var interactorType: ArticleDetailsInteractorProtocol.Type = ArticleDetailsInteractor.self

    /// Set this variable to change the View controller showing article details
    public var articleDetailsViewType: (UIViewController & ArticleDetailsViewProtocol).Type = ArticleDetailsViewController.self

    /// Initializes and returns an article details view controller
    ///
    /// - Parameter article: article to show
    /// - Returns: initialized view controller
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

    /// Creates Article Details view controller from registered type
    ///
    /// - Returns: Initialized View Controller
    public func createNewArticleDetailsView() -> (UIViewController & ArticleDetailsViewProtocol) {
        let view = articleDetailsViewType.init()
        self.view = view
        return view
    }
}
