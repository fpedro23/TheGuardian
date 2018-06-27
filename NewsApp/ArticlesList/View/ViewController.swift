//
//  ViewController.swift
//  NewsApp
//
//  Created by Pedro Contreras on 2018-06-26.
//  Copyright © 2018 Pedro Contreras. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var eventHandler: ArticlesListPresenter?
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "The Guardian"
        self.setupTableView()
        self.prepareInitalData()
        self.registerForPreview()
    }
    
    func registerForPreview(){
        if( traitCollection.forceTouchCapability == .available){
            registerForPreviewing(with: self, sourceView: self.tableView)
        }

    }
    
    func prepareInitalData(){
        self.eventHandler?.fetchNewArticles(for: Date())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setupTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "ArticlesListTableViewCell", bundle: nil), forCellReuseIdentifier: "articlesListTableViewCell")

    }

}


extension ViewController:ArticlesListViewProtocol {
    func reloadData(){
        if tableView.dataSource == nil || tableView.delegate == nil {
            tableView.dataSource = self
            tableView.delegate = self
        }
        self.tableView.reloadData()
    }
}

extension ViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.eventHandler?.numberOfRows(in: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "articlesListTableViewCell", for: indexPath)
        if let articleCell = cell as? ArticlesListCellProtocol {
            eventHandler?.present(articleCell, at: indexPath)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.eventHandler?.title(for: section)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.eventHandler?.numberOfSections() ?? 0
    }
}

extension ViewController:UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.eventHandler?.didSelectRow(at: indexPath)
    }
    
}

extension ViewController:UIViewControllerPreviewingDelegate {
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        guard let indexPath = self.tableView.indexPathForRow(at: location) else { return nil }
        return self.eventHandler?.viewControllerForPreview(at: indexPath)
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        self.eventHandler?.pushControllerFromPreview(viewControllerToCommit)
    }
}
