//
//  NetworkLayerProtocol.swift
//  NewsApp
//
//  Created by Pedro Contreras on 2018-06-26.
//  Copyright © 2018 Pedro Contreras. All rights reserved.
//

import Foundation


typealias ArticleFetchResultBlock = (([Article])->Void)

protocol NetworkLayer {
    func fetchArticles(for date:Date, completion:@escaping ArticleFetchResultBlock)
}
