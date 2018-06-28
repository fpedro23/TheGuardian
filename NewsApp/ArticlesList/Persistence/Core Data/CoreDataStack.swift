//
//  CoreDataStack.swift
//  NewsApp
//
//  Created by Pedro Contreras on 2018-06-28.
//  Copyright © 2018 Pedro Contreras. All rights reserved.
//

import Foundation
import CoreData
// MARK: - Core Data stack
class CoreDataStack {
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "TheGuardian")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy

            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
        
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}

extension CoreDataStack:PersistenceLayerProtocol {
    
    
    /// Fetch article with a given ID
    ///
    /// - Parameter id: id of Article
    /// - Returns: Article if found, Empty article if its not
    func fetchArticle(with id: String) -> Article {
        let request = NSFetchRequest<CoreDataArticle>(entityName: "CoreDataArticle")
        request.predicate = NSPredicate(format: "id = %@", id)
        request.returnsObjectsAsFaults = false
        do {
            let result = try self.persistentContainer.viewContext.fetch(request)
            guard let article = result.first else {
                return PersistedArticle(id: "Error", date: Date(), title: "Error", content: nil)
            }
            return article.toPersistedArticle()
            
        } catch let error {
            print(error)
            return PersistedArticle(id: "Error", date: Date(), title: "Error", content: nil)
        }
    }
    
    
    /// Saves the given article to the current context
    ///
    /// - Parameter article: article to persist
    func persistArticle(_ article: Article) {
        let context = self.persistentContainer.viewContext
        if let coreDataArticle = NSEntityDescription.insertNewObject(forEntityName: "CoreDataArticle",into: context) as? CoreDataArticle {
            coreDataArticle.title = article.title
            coreDataArticle.content = article.content
            coreDataArticle.id = article.id
            coreDataArticle.date = article.date as NSDate
            do {
                try context.save()
            }catch let error {
                print(error)
            }
        }
    }
    
    
    /// Lists all the existing articles in the database
    ///
    /// - Returns: Array of Articles
    func fetchArticles() -> [Article]{
        let request = NSFetchRequest<CoreDataArticle>(entityName: "CoreDataArticle")
        request.returnsObjectsAsFaults = false
        do {
            let result = try self.persistentContainer.viewContext.fetch(request)
            return result.map{return $0.toPersistedArticle()}
            
        } catch let error {
            print(error)
            return []
        }
    }
}

