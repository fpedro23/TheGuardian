//
//  ArticlesListTableViewCell.swift
//  NewsApp
//
//  Created by Pedro Contreras on 2018-06-26.
//  Copyright © 2018 Pedro Contreras. All rights reserved.
//

import UIKit

class ArticlesListTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension ArticlesListTableViewCell : ArticlesListCellProtocol {
    func setTitle(title:String){
        self.titleLabel.text = title
    }
    func setTime(time:String){
        self.timeLabel.text = time
    }
}
