//
//  ArticlesListWireframe.swift
//  NewsApp
//
//  Created by Pedro Contreras on 2018-06-26.
//  Copyright © 2018 Pedro Contreras. All rights reserved.
//

import Foundation
import UIKit

class ArticlesListWireframe:NSObject {
    
    /// Presenter
    var presenter:ArticlesListPresenter?
    
    /// Application's navigation controller
    var navigationController:UINavigationController?
    
    /// Wireframe to the next VIPER module
    var articleDetailsWireframe = ArticleDetailsWireframe()
    
    
    /// Shows the Article Details VIPER module
    ///
    /// - Parameter article: article to show
    func showArticleDetails(_ article:Article){
        self.navigationController?.pushViewController(articleDetailsWireframe.mainViewController(article: article), animated: true)
    }
    
    
    /// Returns an instantiated VIPER main view controller
    /// Useful for peek and pop feature
    /// - Parameter article: article to show
    /// - Returns: Instantiated view controller
    func viewControllerForPreview(article:Article) -> UIViewController {
        return articleDetailsWireframe.mainViewController(article: article)
    }
    
    
    /// Shows the given view controller from peek and pop feature
    ///
    /// - Parameter controller: controller to show
    func pushControllerFromPreview(_ controller:UIViewController){
        self.navigationController?.show(controller, sender: self)
    }
    
}


