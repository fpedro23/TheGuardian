//
//  ArticlesListCellProtocol.swift
//  NewsApp
//
//  Created by Pedro Contreras on 2018-06-26.
//  Copyright © 2018 Pedro Contreras. All rights reserved.
//

import Foundation

/// Cells showing information of an article in a list should conform to this protocol
protocol ArticlesListCellProtocol {

    /// Sets the title of the cell
    ///
    /// - Parameter title: title
    func setTitle(title: String)

    /// Sets the date in the cell
    ///
    /// - Parameter time: date
    func setTime(time: String)
}
