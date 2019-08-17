//
//  ArticleDetailTitleCell.swift
//  NewsAPI
//
//  Created by Andrey Nedov on 12/08/2019.
//  Copyright © 2019 Andrey Nedov. All rights reserved.
//

import UIKit

class ArticleDetailTitleCell: UITableViewCell, NibLoadable, ImageDownloaderDelegate {

    @IBOutlet weak var imageV: UIImageView!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    var imageDownloader: ImageDownloader?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configure(_ article: DisplayedArticle?){
        guard let article = article else {return}
        titleLabel.text = article.title
        sourceLabel.text = article.source
        if let url = URL(string: article.urlToImage){
            self.imageDownloader = ImageDownloader(imageURL: url)
            self.imageDownloader?.delegate = self
            self.imageDownloader?.downloadImage()
        }
    }
    func didFinishDownloading(_ sender: ImageDownloader) {
        imageV.image = imageDownloader?.image
    }
}
