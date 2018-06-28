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

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CoreDataArticle> {
        return NSFetchRequest<CoreDataArticle>(entityName: "CoreDataArticle")
    }

    @NSManaged public var id: String?
    @NSManaged public var title: String?
    @NSManaged public var date: NSDate?
    @NSManaged public var content: String?

}
