//
//  ArticleListPresenterProtocol.swift
//  NewsApp
//
//  Created by Pedro Contreras on 2018-06-28.
//  Copyright © 2018 Pedro Contreras. All rights reserved.
//

import Foundation
import UIKit

protocol ArticlesListPresenterProtocol{
    
    var wireframe:ArticlesListWireframe? { get set }
    var interactor:ArticlesListInteractorProtocol? { get set }
    var view:ArticlesListViewProtocol? { get set }
    

    func numberOfSections() -> Int
    func numberOfRows(in section: Int) -> Int
    func title(for section: Int) -> String
    func present(_ cell:ArticlesListCellProtocol, at indexPath:IndexPath)
    func didSelectRow(at indexPath:IndexPath)
    func fetchNewArticles(for date:Date, replace:Bool)
    func didReceiveNewArticles(articles:[Article], error:String, replace:Bool)
    func viewControllerForPreview(at indexPath:IndexPath) -> UIViewController?
    func pushControllerFromPreview(_ controller:UIViewController)
    func tableViewDidReachBottom()
    
}
