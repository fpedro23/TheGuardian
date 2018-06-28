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
    
    
    /// Article List VIPER Module Navigator
    var articlesListNavigator = ArticlesListNavigator()
    
    
    /// Creates and sets initial view controller to the given window
    ///
    /// - Parameter window: Main Window
    func buildApp(window: UIWindow) {
        self.buildViewHierarchy(window: window)
    }

    /// Builds and sets initial view controller to the given window.
    ///
    /// - Parameter window: Main Window
    private func buildViewHierarchy(window:UIWindow){
        let coreViews = buildCoreViews()
        let navigationController = UINavigationController(rootViewController: coreViews.articlesList ?? UIViewController())
        window.rootViewController = navigationController
        self.articlesListNavigator.articlesListWireframe.navigationController = navigationController
        self.setupArticleListModule(coreViews: coreViews)
        self.articlesListNavigator.setup()
    }
    
    
    /// Creates the VIPER module for the article list view
    ///
    /// - Parameter coreViews: coreviews containing the list view
    func setupArticleListModule(coreViews:CoreViews){
        self.articlesListNavigator.articlesListView = coreViews.articlesList as? ArticlesListViewProtocol
    }
    
    
    /// Will Create all the initial view controllers
    /// Insert different view controllers in this section. i.e Tab Bar Controller
    /// - Returns: The initialized View Controllers
    private func buildCoreViews() -> CoreViews{
        var coreViews = CoreViews()
        coreViews.articlesList = getInitalControllerFromStoryboard(storyboardName: "Main")
        return coreViews
    }
    
    
    /// Convenience method to instantiate a View Controller from a Storyboard
    ///
    /// - Parameter storyboardName: Name of the storyboard
    /// - Returns: The initial view controller of that storyboard
    private func getInitalControllerFromStoryboard(storyboardName: String) -> UIViewController {
        return UIStoryboard(name: storyboardName, bundle: nil).instantiateInitialViewController()!
    }
    
    
}
