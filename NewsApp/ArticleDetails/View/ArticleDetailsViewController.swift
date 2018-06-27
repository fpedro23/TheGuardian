//
//  ArticleDetailsViewController.swift
//  NewsApp
//
//  Created by Pedro Contreras on 2018-06-27.
//  Copyright © 2018 Pedro Contreras. All rights reserved.
//

import UIKit
import WebKit

class ArticleDetailsViewController: UIViewController {

    var eventHandler: ArticleDetailsPresenterProtocol?
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var bodyView: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.eventHandler?.fetchArticleDetails()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        print("🌳")
    }

    func setCSSToHTMLString(_ string:String) -> String {
        let strCssHead = "<head><link rel=\"stylesheet\" type=\"text/css\" href=\"iPhone.css\"></head>"
        return strCssHead + string
    }

}

extension ArticleDetailsViewController : ArticleDetailsViewProtocol {
    func setTitle(_ title:String) {
        self.titleLabel.text = title
    }
    
    func setDate(_ date: String) {
        self.dateLabel.text = date
    }
    
    func setBody(_ body: String) {
        let cssURL:URL?
        if let cssPath = Bundle.main.path(forResource: "iPhone", ofType: "css"){
            cssURL = URL(fileURLWithPath:cssPath)
        }else{
            cssURL = nil
        }
        let resultString = setCSSToHTMLString(body)
        
        self.bodyView.loadHTMLString(resultString,
                                     baseURL: cssURL)
        
        
        
    }
    
    
}
