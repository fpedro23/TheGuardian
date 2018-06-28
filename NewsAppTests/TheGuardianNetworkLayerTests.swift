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

class TheGuardianNetworkLayerTests: QuickSpec {
    
    override func spec() {
        super.spec()
        describe("The guardian Network Layer") {
            var networkLayer:TheGuardianNetworkLayer!
            let pageSize = 20
            let expectedAPI = "https://content.guardianapis.com/search"
            var testArticles:[Article]?
            beforeEach {
                networkLayer = TheGuardianNetworkLayer()
            }
            context("Parsing"){
                it("Parse Articles"){
                    networkLayer.fetchArticles(for: Date()){ articles, error in
                        print("🤖🤖🤖🤖🤖")
                        testArticles = articles
                    }
                    
                    
                    print("🌳🌳🌳🌳🌳🌳🌳🌳🌳🌳")
                    expect(testArticles).toEventuallyNot(beNil(), timeout: 10)
                    testArticles?.forEach{
                        expect($0.title).toNot(beEmpty())
                        expect($0.id).toNot(beEmpty())
                        expect($0.date).toNot(beNil())
                    }
                    
                }
                
                it("Parse Articles with the correct page size "){
                    networkLayer.fetchArticles(for: Date()){ articles, error in
                        print("🤖🤖🤖🤖🤖")
                        testArticles = articles
                    }
                    
                    
                    print("🌳🌳🌳🌳🌳🌳🌳🌳🌳🌳")
                    expect(testArticles).toEventuallyNot(beNil(), timeout: 3)
                    expect(testArticles?.count) == pageSize
                }
                
                it("Reaches for the correct url for parsing news"){
                    expect(networkLayer.requestURL) == expectedAPI
                }
                
                it("Handles JSON Format Errors"){
                    networkLayer.format = "xml"
                    var expectedError:String?
                    networkLayer.fetchArticles(for: Date()){ articles, error in
                        print("🤖🤖🤖🤖🤖")
                        testArticles = articles
                        expectedError = error
                    }
                    
                    
                    print("🌳🌳🌳🌳🌳🌳🌳🌳🌳🌳")
                    expect(expectedError).toEventuallyNot(beNil(), timeout: 10)
                }
                
            }
        }
    }
}
