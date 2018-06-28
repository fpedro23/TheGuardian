//
//  ArticleListInteractorProtocol.swift
//  NewsApp
//
//  Created by Pedro Contreras on 2018-06-28.
//  Copyright © 2018 Pedro Contreras. All rights reserved.
//

import Foundation

protocol ArticlesListInteractorProtocol {
    var networkLayer:NetworkLayer {get set}
    var persistenceLayer:PersistenceLayerProtocol? {get set}
    var presenter:ArticlesListPresenterProtocol? {get set}
    
    init(networkLayer:NetworkLayer)
    func fetchArticles(for date:Date, completion:@escaping ArticleFetchResultBlock)
}



