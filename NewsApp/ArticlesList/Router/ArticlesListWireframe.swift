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
    var presenter:ArticlesListPresenter?
    var navigationController:UINavigationController?
    var articleDetailsWireframe = ArticleDetailsWireframe()
    
    func showArticleDetails(_ article:Article){
        self.navigationController?.pushViewController(articleDetailsWireframe.mainViewController(article: article), animated: true)
    }
    
    func viewControllerForPreview(article:Article) -> UIViewController {
        return articleDetailsWireframe.mainViewController(article: article)
    }
    
    func pushControllerFromPreview(_ controller:UIViewController){
        self.navigationController?.show(controller, sender: self)
    }
    
}


