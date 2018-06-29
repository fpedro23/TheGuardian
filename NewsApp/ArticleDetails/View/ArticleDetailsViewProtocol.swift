//
//  ArticleDetailsViewProtocol.swift
//  NewsApp
//
//  Created by Pedro Contreras on 2018-06-27.
//  Copyright © 2018 Pedro Contreras. All rights reserved.
//

import Foundation

protocol ArticleDetailsViewProtocol: class {
    var eventHandler: ArticleDetailsPresenterProtocol? { get set }
    func setTitle(_ title: String)
    func setDate(_ date: String)
    func setBody(_ body: String)
}
