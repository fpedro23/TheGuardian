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
    
    
    /// Copies the content of the NSManagedObject to a POSO
    ///
    /// - Returns: POSO containing the information of the NSManagedObject
    func toPersistedArticle() -> PersistedArticle {
        let article = PersistedArticle(id: self.id ?? "",
                                       date: self.date as Date? ?? Date(),
                                       title: self.title ?? "",
                                       content: self.content ?? "")
        return article
    }
    
}
