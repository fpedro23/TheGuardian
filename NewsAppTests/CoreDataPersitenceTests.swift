//
//  TheGuardianNetworkLayerTests.swift
//  NewsAppTests
//
//  Created by Pedro Contreras on 2018-06-28.
//  Copyright © 2018 Pedro Contreras. All rights reserved.
//

import Quick
import Nimble
import CoreData

@testable import The_Guardian

class CoreDataPersitenceTests: QuickSpec {

    override func spec() {
        super.spec()
        describe("Core Data stack test") {
            var persistenceLayer: CoreDataStack!
            let expectedArticle = PersistedArticle(id: "1", date: Date(), title: "", content: "Content")
            beforeEach {
                persistenceLayer = CoreDataStack()
            }

            it("Creates Articles") {
                persistenceLayer!.persistArticle(expectedArticle)
            }

            it("Fetches Articles") {
                expect(persistenceLayer!.fetchArticles().count) > 0
            }

            it("Fetches a Given Article") {
                let fetchedArticle = persistenceLayer!.fetchArticle(with: expectedArticle.id)
                expect(fetchedArticle.id) == expectedArticle.id
            }

        }
    }
}
