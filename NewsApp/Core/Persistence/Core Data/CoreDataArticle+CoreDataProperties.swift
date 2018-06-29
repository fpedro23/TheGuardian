//
//  CoreDataArticle+CoreDataProperties.swift
//  
//
//  Created by Pedro Contreras on 2018-06-28.
//
//

import Foundation
import CoreData

extension CoreDataArticle {

    /// Type safe fetch request for CoreDataArticle
    ///
    /// - Returns: Initialized NSFetchRequest
    @nonobjc public class func fetchRequest() -> NSFetchRequest<CoreDataArticle> {
        return NSFetchRequest<CoreDataArticle>(entityName: "CoreDataArticle")
    }

    /// Unique identifier of the article
    @NSManaged public var id: String?

    /// Title of the article
    @NSManaged public var title: String?

    /// Date of publication of the article
    @NSManaged public var date: NSDate?

    /// Content of the article
    @NSManaged public var content: String?

}
