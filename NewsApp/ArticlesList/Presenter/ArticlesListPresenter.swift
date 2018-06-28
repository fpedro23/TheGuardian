//
//  ArticlesListPresenter.swift
//  NewsApp
//
//  Created by Pedro Contreras on 2018-06-26.
//  Copyright © 2018 Pedro Contreras. All rights reserved.
//

import Foundation
import UIKit

class ArticlesListPresenter{
    
    public var wireframe:ArticlesListWireframe?
    var interactor:ArticlesListInteractor?
    var view:ArticlesListViewProtocol?
    var articles:[Date:[Article]] = [:]
    lazy var titleIndexes: [Date] = {
        return self.createIndex()
    }()
    var isLoadingData = false
    
    let dateformatter:DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()
    
    let sectionDateFormatter:DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter
    }()
    
    func createIndex() -> [Date]{
        return articles.keys.sorted(by: >)
    }
    
    func numberOfSections() -> Int{
        return titleIndexes.count
    }
    
    func numberOfRows(in section: Int) -> Int{
        let date = titleIndexes[section]
        guard let articles = articles[date] else { return 0 }
        return articles.count
    }
    
    func title(for section: Int) -> String{
        return sectionDateFormatter.string(from: titleIndexes[section])
    }

    func present(_ cell:ArticlesListCellProtocol, at indexPath:IndexPath){
        let article = self.article(at: indexPath)
        cell.setTitle(title: article.title)
        cell.setTime(time: dateformatter.string(from: article.date))
    }
    
    func article(at indexPath:IndexPath) -> Article {
        let date  = titleIndexes[indexPath.section]
        return self.articles[date]?[indexPath.row] ?? PersistedArticle(title: "Error 🚨", content: "nil")
        
    }
    
    func didReceiveNewArticles(articles:[Article], error:String, replace:Bool = true){
        self.isLoadingData = false
        if !error.isEmpty{
            return
        }
        let newArticles = makeHashTable(from: articles)
        
        if (self.articles as NSDictionary).isEqual(to: newArticles as [AnyHashable : Any]) {
            return
        }
        
        self.articles = makeHashTable(from: articles, replace: replace)
        self.titleIndexes = self.createIndex()
        self.view?.reloadData()
    }
    
    func makeHashTable(from articles:[Article], replace:Bool = false) -> [Date: [Article]] {
        var hashTable: [Date: [Article]]
        if replace {
            hashTable = [:]
        }else{
            hashTable = self.articles
        }
        
        for article in articles {
            let components =  Calendar.current.dateComponents([.year,.day,.month], from: article.date)
            
            let key = Calendar.current.date(from: components)!
            
            if var currentArticles = hashTable[key] {
                
                if currentArticles.contains(where: {return $0.id == article.id }){
                    continue
                }
                currentArticles.append(article)
                hashTable.updateValue(currentArticles, forKey: key)
            } else {
                hashTable.updateValue([article], forKey: key)
            }
            
        }
        return hashTable
    }
    
    func didSelectRow(at indexPath:IndexPath){
        let article = self.article(at: indexPath)
        self.wireframe?.showArticleDetails(article)
    }
    
    func fetchNewArticles(for date:Date, replace:Bool = true){
        if isLoadingData { return }
        self.isLoadingData = true
        self.interactor?.fetchArticles(for: date){ articles, error in
            self.didReceiveNewArticles(articles: articles, error: error, replace: replace)
        }
    }
    
    func viewControllerForPreview(at indexPath:IndexPath) -> UIViewController? {
        let article = self.article(at: indexPath)
        return self.wireframe?.viewControllerForPreview(article: article)
    }
    
    func pushControllerFromPreview(_ controller:UIViewController){
        self.wireframe?.pushControllerFromPreview(controller)
    }
    
    func tableViewDidReachBottom(){
        fetchNewArticles(for: self.titleIndexes.first ?? Date(), replace: false)
    }
    
}
