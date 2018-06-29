//
//  ArticleListPresenterProtocol.swift
//  NewsApp
//
//  Created by Pedro Contreras on 2018-06-28.
//  Copyright © 2018 Pedro Contreras. All rights reserved.
//

import Foundation
import UIKit

protocol ArticlesListPresenterProtocol {

    /// Wireframe
    var wireframe: ArticlesListWireframe? { get set }

    /// Interactor
    var interactor: ArticlesListInteractorProtocol? { get set }

    /// View
    var view: ArticlesListViewProtocol? { get set }

    /// Number of sections in data
    ///
    /// - Returns: number of sections
    func numberOfSections() -> Int

    /// Number of Rows in Section Key
    ///
    /// - Parameter section: section number
    /// - Returns: number of rows
    func numberOfRows(in section: Int) -> Int

    /// Title for a given section
    ///
    /// - Parameter section: section number
    /// - Returns: Ttile for section
    func title(for section: Int) -> String

    /// Prepares a TableViewCell for Displaying
    ///
    /// - Parameters:
    ///   - cell: cell
    ///   - indexPath: indexpath
    func present(_ cell: ArticlesListCellProtocol, at indexPath: IndexPath)

    /// Capture touch from UITableView
    ///
    /// - Parameter indexPath: indexPath
    func didSelectRow(at indexPath: IndexPath)

    /// Requests the interactor to load more articles
    ///
    /// - Parameters:
    ///   - date: date
    ///   - replace: replace current dictionary, i.e. dont accumulate articles
    func fetchNewArticles(for date: Date, replace: Bool)

    /// Handler for articles received from the interactor
    ///
    /// - Parameters:
    ///   - articles: articles
    ///   - error: string containing error, if any
    ///   - replace: replace current dictionary?
    func didReceiveNewArticles(articles: [Article], error: String, replace: Bool)

    /// Requests the wireframe to provide a controller for peek and pop feature
    ///
    /// - Parameter indexPath: indexPath
    /// - Returns: Instantiated View Controller
    func viewControllerForPreview(at indexPath: IndexPath) -> UIViewController?

    /// Request the wireframe to show the given controller
    ///
    /// - Parameter controller: viewController
    func pushControllerFromPreview(_ controller: UIViewController)

    /// Table View Did reach bottom
    func tableViewDidReachBottom()

}
