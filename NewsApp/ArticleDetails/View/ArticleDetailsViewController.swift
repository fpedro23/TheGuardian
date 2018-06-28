//
//  ArticleDetailsViewController.swift
//  NewsApp
//
//  Created by Pedro Contreras on 2018-06-27.
//  Copyright © 2018 Pedro Contreras. All rights reserved.
//

import UIKit
import WebKit

var observationContext = 0

class ArticleDetailsViewController: UIViewController {

    var eventHandler: ArticleDetailsPresenterProtocol?
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var bodyView: WKWebView!
    @IBOutlet weak var bodyViewHeightConstraint: NSLayoutConstraint!
    var observing = false

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setBody("")
        self.setTitle("")
        self.setDate("")
        self.eventHandler?.fetchArticleDetails()
        self.bodyView.scrollView.isScrollEnabled = false
        self.bodyView.navigationDelegate = self
        //self.bodyView.removeGestureRecognizer(<#T##gestureRecognizer: UIGestureRecognizer##UIGestureRecognizer#>)

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
    
    func startObservingHeight() {
        let options = NSKeyValueObservingOptions([.new])
        bodyView.scrollView.addObserver(self, forKeyPath: "contentSize", options: options, context: &observationContext)
        observing = true;
    }
    
    func stopObservingHeight() {
        bodyView.scrollView.removeObserver(self, forKeyPath: "contentSize", context: &observationContext)
        observing = false
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        guard let keyPath = keyPath else {
            super.observeValue(forKeyPath: nil, of: object, change: change, context: context)
            return
        }
        switch keyPath {
        case "contentSize":
            if context == &observationContext {
                bodyViewHeightConstraint.constant = bodyView.scrollView.contentSize.height
            }
        default:
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
        }
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

extension ArticleDetailsViewController : WKNavigationDelegate{
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        bodyViewHeightConstraint.constant = self.bodyView.scrollView.contentSize.height
        if (!observing) {
            startObservingHeight()
        }
    }
}
