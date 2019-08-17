//
//  ArticleDetailCell.swift
//  NewsAPI
//
//  Created by Andrey Nedov on 12/08/2019.
//  Copyright © 2019 Andrey Nedov. All rights reserved.
//

import UIKit

class ArticleDetailCell: UITableViewCell, NibLoadable  {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    func configure(_ article: DisplayedArticle?){
        guard let article = article else {return}
        descriptionLabel.text = article.description
        contentLabel.text = article.content
    }

}
