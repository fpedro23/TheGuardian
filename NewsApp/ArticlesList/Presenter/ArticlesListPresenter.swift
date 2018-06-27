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
        return self.articles[date]?[indexPath.row] ?? Article(title: "Error 🚨", image: nil, content: nil)
        
    }
    
    func didReceiveNewArticles(articles:[Article]){
        self.articles = makeHashTable(from: articles)
        self.titleIndexes = self.createIndex()
        self.view?.reloadData()
    }
    
    func makeHashTable(from articles:[Article]) -> [Date: [Article]] {
        var hashTable: [Date: [Article]] = [:]
        for article in articles {
            let components =  Calendar.current.dateComponents([.year,.day,.month], from: article.date)
            
            let key = Calendar.current.date(from: components)!
            
            if var currentArticles = hashTable[key] {
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
    
    func fetchNewArticles(for date:Date){
        self.interactor?.fetchArticles(for: date, completion: didReceiveNewArticles)
    }
    
    func viewControllerForPreview(at indexPath:IndexPath) -> UIViewController? {
        let article = self.article(at: indexPath)
        return self.wireframe?.viewControllerForPreview(article: article)
    }
    
    func pushControllerFromPreview(_ controller:UIViewController){
        self.wireframe?.pushControllerFromPreview(controller)
    }
    
}
