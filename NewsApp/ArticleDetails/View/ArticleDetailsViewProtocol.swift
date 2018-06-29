//
//  ArticleDetailsViewProtocol.swift
//  NewsApp
//
//  Created by Pedro Contreras on 2018-06-27.
//  Copyright © 2018 Pedro Contreras. All rights reserved.
//

import Foundation

/// View Controllers that want to show article details should conform to this protocol
protocol ArticleDetailsViewProtocol: class {

    /// Handler of UI Events
    var eventHandler: ArticleDetailsPresenterProtocol? { get set }

    /// Sets title of article
    ///
    /// - Parameter title: title
    func setTitle(_ title: String)

    /// Sets date of article
    ///
    /// - Parameter date: date
    func setDate(_ date: String)

    /// Sets body of article
    ///
    /// - Parameter body: body
    func setBody(_ body: String)
}
