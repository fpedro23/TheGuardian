//
//  Article.swift
//  NewsApp
//
//  Created by Pedro Contreras on 2018-06-28.
//  Copyright © 2018 Pedro Contreras. All rights reserved.
//

import Foundation


/// Article
protocol Article:class {
    
    /// Identifier of the article
    var id:String {get set}
    
    /// Title of the article
    var title:String { get set }
    
    /// Date of creation of the article
    var date:Date { get set }

    /// Content of the article
    var content:String? { get set}
}


