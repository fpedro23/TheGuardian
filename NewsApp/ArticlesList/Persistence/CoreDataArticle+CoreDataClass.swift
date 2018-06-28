//
//  CoreDataArticle+CoreDataClass.swift
//  
//
//  Created by Pedro Contreras on 2018-06-28.
//
//

import Foundation
import CoreData


public class CoreDataArticle: NSManagedObject {
    func toPersistedArticle() -> PersistedArticle {
        let article = PersistedArticle(id: self.id ?? "",
                                       date: self.date as Date? ?? Date(),
                                       title: self.title ?? "",
                                       content: self.content ?? "")
        return article
    }
}
