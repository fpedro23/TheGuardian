//
//  ArticlesListViewProtocol.swift
//  NewsApp
//
//  Created by Pedro Contreras on 2018-06-26.
//  Copyright © 2018 Pedro Contreras. All rights reserved.
//

import Foundation

/// All Views that want to show a list of articles should conform to this protocol
protocol ArticlesListViewProtocol: class {

    /// UI interactions handler
    var eventHandler: ArticlesListPresenter? { get set }

    /// Triggered when new data is available from presenter
    func reloadData()
}
