//
//  ArticlesListNavigator.swift
//  NewsApp
//
//  Created by Pedro Contreras on 2018-06-26.
//  Copyright © 2018 Pedro Contreras. All rights reserved.
//

import Foundation

class ArticlesListNavigator {
    
    public var articlesListWireframe = ArticlesListWireframe()
    public var articlesListView: ArticlesListViewProtocol?

    func setup(){
        self.setupArticlesListModule()
    }
    
    func setupArticlesListModule(){
        //articlesListWireframe
        let interactor = ArticlesListInteractor(networkLayer: TheGuardianNetworkLayer())
        let presenter = ArticlesListPresenter()
        presenter.view = articlesListView
        presenter.interactor = interactor
        presenter.wireframe = articlesListWireframe
        interactor.presenter = presenter
        articlesListView?.eventHandler = presenter
        articlesListWireframe.presenter = presenter
    }
}
