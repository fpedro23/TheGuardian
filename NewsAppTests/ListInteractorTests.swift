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

class ListInteractorTests: QuickSpec {
    
    override func spec() {
        super.spec()
        describe("List Interactor") {
            var interactor: ArticlesListInteractor!
            var testArticles:[Article]?
            let numberOfArticles = 20
            let numberOfPersistedArticles = 16
            beforeEach {
                interactor = ArticlesListInteractor(networkLayer: OfflineNetworkLayer(numberOfArticles: numberOfArticles))
                interactor.persistenceLayer = MockPersistenceStore(numberOfArticles: numberOfPersistedArticles)
            }
            context("Fetching Articles"){
                it("Fetch articles"){
                    interactor.fetchArticles(for: Date()){ articles, error in
                        print("🤖🤖🤖🤖🤖")
                        testArticles = articles
                    }
                    print("🌳🌳🌳🌳🌳🌳🌳🌳🌳🌳")
                    expect(testArticles).toEventuallyNot(beNil(), timeout: 3)
                    expect(testArticles?.count) == numberOfArticles
                }
                
                it("Fetch articles from the local store when Internet is not available"){
                    interactor.isReachable = false
                    interactor.fetchArticles(for: Date()){ articles, error in
                        print("🤖🤖🤖🤖🤖")
                        testArticles = articles
                    }
                    print("🌳🌳🌳🌳🌳🌳🌳🌳🌳🌳")
                    expect(testArticles).toEventuallyNot(beNil(), timeout: 3)
                    expect(testArticles?.count) == numberOfPersistedArticles
                }
                
            }
            
        }
    }
    
    
}
