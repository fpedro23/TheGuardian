//
//  NetworkLayerProtocol.swift
//  NewsApp
//
//  Created by Pedro Contreras on 2018-06-26.
//  Copyright © 2018 Pedro Contreras. All rights reserved.
//

import Foundation
import Alamofire

typealias ArticleFetchResultBlock = (([Article], String) -> Void)

/// Network Service Protocol
protocol NetworkLayer {

    /// Fetches articles from the network
    ///
    /// - Parameters:
    ///   - date: date
    ///   - completion: completion block
    func fetchArticles(for date: Date, completion:@escaping ArticleFetchResultBlock)
}

/// Protocol to determine reachability status of network
protocol Reachable {

    /// Callback executed when network state changes
    ///
    /// - Parameter status: the new status
    func listener(status: NetworkReachabilityManager.NetworkReachabilityStatus)
}
