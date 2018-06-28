//
//  ArticleDetailsWireframeTests.swift
//  NewsAppTests
//
//  Created by Pedro Contreras on 2018-06-28.
//  Copyright © 2018 Pedro Contreras. All rights reserved.
//

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

class ArticleDetailsWireframeTests: QuickSpec {
    
    
    override func spec() {
        super.spec()
        describe("Creates a new Article detail wireframe") {
            var wireframe:ArticleDetailsWireframe!
            var viewController:ArticleDetailsViewController!
            let expectedArticle = PersistedArticle(title: "", content: nil)
            
            beforeEach {
                wireframe = ArticleDetailsWireframe()
                viewController = wireframe.mainViewController(article: expectedArticle) as! ArticleDetailsViewController
            }
            
            it("Sets View's Presenter"){
               expect(viewController.eventHandler).toNot(beNil())
            }
            
            it("Sets Presenter's view"){
                expect(wireframe.presenter?.view).toNot(beNil())
            }
            
            it("Sets Presenter's Interactor"){
                expect(wireframe.presenter?.interactor).toNot(beNil())
            }
            
            it("Sets Interactor's presenter"){
                expect(wireframe.presenter?.interactor?.presenter).toNot(beNil())
            }
        }
    }
}
