//
//  ArticleDetailsInteractorTests.swift
//  NewsAppTests
//
//  Created by Pedro Contreras on 2018-06-28.
//  Copyright © 2018 Pedro Contreras. All rights reserved.
//

//
//  ListInteractorTests.swift
//  NewsAppTests
//
//  Created by Pedro Contreras on 2018-06-28.
//  Copyright © 2018 Pedro Contreras. All rights reserved.
//

import Quick
import Nimble

@testable import The_Guardian

class ArticleDetailsPresenterTests: QuickSpec {
    
    override func spec() {
        super.spec()
        describe("Article Details Presenter") {
            var presenter: ArticleDetailsPresenter!
            let expectedArticle:Article = PersistedArticle(id: "1", date: Date(), title: "Test Online Article", content: "")
            
            beforeEach {
                presenter = ArticleDetailsPresenter()
            }
            context("On Received article"){
                it("Sets information"){
                    presenter.didReceiveArticleInformation(article: expectedArticle, error: "")
                }
                
                it("Requests Interactor for information"){
                    presenter.fetchArticleDetails()
                }
                
                it("Sets Content to empty when content is nil"){
                    let anArticle = expectedArticle
                        anArticle.content = nil
                    presenter.didReceiveArticleInformation(article: anArticle, error: "")
                }
            }
        }
    }
    
}
