//
//  ArticlesListNavigator.swift
//  NewsApp
//
//  Created by Pedro Contreras on 2018-06-26.
//  Copyright © 2018 Pedro Contreras. All rights reserved.
//

import Foundation

class ArticlesListNavigator {

    /// Wireframe
    public var articlesListWireframe = ArticlesListWireframe()

    /// Main view controller of VIPER module
    public var articlesListView: ArticlesListViewProtocol?

    /// Instantiate VIPER module
    func setup() {
        self.setupArticlesListModule()
    }

    /// Connects and instantiates all the components of the List VIPER module
    func setupArticlesListModule() {
        //articlesListWireframe
        let interactor = ArticlesListInteractor(networkLayer: TheGuardianNetworkLayer())
        interactor.persistenceLayer = CoreDataStack()
        let presenter = ArticlesListPresenter()
        presenter.view = articlesListView
        presenter.interactor = interactor
        presenter.wireframe = articlesListWireframe
        interactor.presenter = presenter
        articlesListView?.eventHandler = presenter
        articlesListWireframe.presenter = presenter
    }
}
