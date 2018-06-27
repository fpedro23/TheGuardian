//
//  AppBuilder.swift
//  NewsApp
//
//  Created by Pedro Contreras on 2018-06-26.
//  Copyright © 2018 Pedro Contreras. All rights reserved.
//

import Foundation
import UIKit

class AppBuilder {
    
    var articlesListNavigator = ArticlesListNavigator()

    func buildApp(window: UIWindow) {
        self.buildViewHierarchy(window: window)
    }
    
    func buildViewHierarchy(window:UIWindow){
        let coreViews = buildCoreViews()
        let navigationController = UINavigationController(rootViewController: coreViews.articlesList ?? UIViewController())
        window.rootViewController = navigationController
        self.articlesListNavigator.articlesListWireframe.navigationController = navigationController
        self.setupArticleListModule(coreViews: coreViews)
        self.articlesListNavigator.setup()
    }
    
    func setupArticleListModule(coreViews:CoreViews){
        self.articlesListNavigator.articlesListView = coreViews.articlesList as? ArticlesListViewProtocol
    }
    
    
    func buildCoreViews() -> CoreViews{
        var coreViews = CoreViews()
        coreViews.articlesList = getInitalControllerFromStoryboard(storyboardName: "Main")
        return coreViews
    }
    
    func getInitalControllerFromStoryboard(storyboardName: String) -> UIViewController {
        return UIStoryboard(name: storyboardName, bundle: nil).instantiateInitialViewController()!
    }
    
    
}
