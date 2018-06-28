//
//  ArticleDetailsViewController.swift
//  NewsAppTests
//
//  Created by Pedro Contreras on 2018-06-28.
//  Copyright © 2018 Pedro Contreras. All rights reserved.
//

import Quick
import Nimble

@testable import The_Guardian

class ArticleDetailsViewControllerTests: QuickSpec {
    
    let dateformatter:DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()
    
    override func spec() {
        super.spec()
        describe("Article Details View Controller") {
            var viewController:ArticleDetailsViewController!
            let expectedArticle = PersistedArticle(id: "1", date: Date(), title: "", content: "Content")
            
            beforeEach {
                viewController = ArticleDetailsViewController()
                viewController.loadView()
                viewController.viewDidLoad()
            }
            
            it("Sets Title"){
                viewController.setTitle(expectedArticle.title)
                expect(viewController.titleLabel.text) == expectedArticle.title
            }
            
            it("Sets Date"){
                viewController.setDate(self.dateformatter.string(from: expectedArticle.date))
                expect(viewController.dateLabel.text) == self.dateformatter.string(from: expectedArticle.date)
            }
        }
    }
}
