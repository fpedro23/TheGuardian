//
//  TheGuardianNetworkLayerTests.swift
//  NewsAppTests
//
//  Created by Pedro Contreras on 2018-06-28.
//  Copyright © 2018 Pedro Contreras. All rights reserved.
//


import Quick
import Nimble

@testable import The_Guardian

class TheGuardianDetailsNetworkLayerTests: QuickSpec {
    
    override func spec() {
        super.spec()
        describe("The guardian Network Layer") {
            var networkLayer:TheGuardianArticleDetailsNetworkLayer!
            let expectedAPI = "https://content.guardianapis.com/"
            let expectedArticle:Article = PersistedArticle(id: "stage/2018/may/29/edinburgh-international-childrens-festival-review-baba-yaga-stick-by-me", date: Date(), title: "Title", content: nil)
            var testArticle:Article?
            
            beforeEach {
                networkLayer = TheGuardianArticleDetailsNetworkLayer()
            }
            context("Parsing"){
                it("Parse Articles"){
                    networkLayer.fetchDetailsFromArticle(expectedArticle){ article, error in
                        print("🤖🤖🤖🤖🤖")
                        testArticle = expectedArticle
                    }
                    
                    
                    print("🌳🌳🌳🌳🌳🌳🌳🌳🌳🌳")
                    expect(testArticle).toEventuallyNot(beNil(), timeout: 10)
                    expect(testArticle?.id) == expectedArticle.id
                }
                
                
                it("Reaches for the correct url for parsing news"){
                    expect(networkLayer.requestURL) == expectedAPI
                }
                
                it("Handles JSON Format Errors"){
                    networkLayer.format = "xml"
                    var expectedError:String?
                    networkLayer.fetchDetailsFromArticle(expectedArticle){ article, error in
                        print("🤖🤖🤖🤖🤖")
                        testArticle = expectedArticle
                        expectedError = error
                    }
                    
                    
                    print("🌳🌳🌳🌳🌳🌳🌳🌳🌳🌳")
                    expect(expectedError).toEventuallyNot(beEmpty(), timeout: 10)
                }
                
            }
        }
    }
}
