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

class ArticleDetailsInteractorTests: QuickSpec {
    
    override func spec() {
        super.spec()
        describe("Article Details Interactor") {
            var interactor: ArticleDetailsInteractor!
            var testArticle:Article?
            let expectedOnlineArticle:Article = PersistedArticle(id: "1", date: Date(), title: "Test Online Article", content: "")
            
            var expectedPersistedArticle:Article!
            beforeEach {
                interactor = ArticleDetailsInteractor(networkLayer: OfflineArticleDetailsNetworkLayer())
                interactor.persistenceLayer = MockPersistenceStore(numberOfArticles: 10)
                interactor.article = interactor.persistenceLayer?.fetchArticles().first!
                expectedPersistedArticle = interactor.persistenceLayer?.fetchArticles().first!
            }
            context("Fetch article details"){
                it("Fetch article"){
                    interactor.fetchArticleDetails(){ article, error in
                        print("🤖🤖🤖🤖🤖")
                        testArticle = article
                    }
                    print("🌳🌳🌳🌳🌳🌳🌳🌳🌳🌳")
                    expect(testArticle).toEventuallyNot(beNil(), timeout: 3)
                    expect(testArticle?.content) == expectedOnlineArticle.content
                }
                
                it("Fetch articles from the local store when Internet is not available"){
                    interactor.isReachable = false
                    interactor.fetchArticleDetails(){ article, error in
                        print("🤖🤖🤖🤖🤖")
                        testArticle = article
                    }
                    print("🌳🌳🌳🌳🌳🌳🌳🌳🌳🌳")
                    expect(testArticle).toEventuallyNot(beNil(), timeout: 3)
                    expect(testArticle?.content) == expectedPersistedArticle.content
                }
                
            }
            
        }
    }

}
