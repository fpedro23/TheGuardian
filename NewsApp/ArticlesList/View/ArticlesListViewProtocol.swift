//
//  ArticlesListViewProtocol.swift
//  NewsApp
//
//  Created by Pedro Contreras on 2018-06-26.
//  Copyright © 2018 Pedro Contreras. All rights reserved.
//

import Foundation

protocol ArticlesListViewProtocol:class {
    var eventHandler: ArticlesListPresenter? { get set }
    func reloadData()
}
