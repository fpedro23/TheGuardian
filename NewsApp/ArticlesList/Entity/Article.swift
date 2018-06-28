//
//  Article.swift
//  NewsApp
//
//  Created by Pedro Contreras on 2018-06-28.
//  Copyright © 2018 Pedro Contreras. All rights reserved.
//

import Foundation

protocol Article:class {
    var id:String {get set}
    var title:String { get set }
    var date:Date { get set }
    var image:URL? { get set}
    var content:String? { get set}

}


