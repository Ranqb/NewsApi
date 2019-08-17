//
//  ArticleCell.swift
//  NewsAPI
//
//  Created by Andrey Nedov on 12/08/2019.
//  Copyright © 2019 Andrey Nedov. All rights reserved.
//

import UIKit

class ArticleCell: UITableViewCell, NibLoadable, ImageDownloaderDelegate {

    // MARK: IBOutlets
    
    @IBOutlet var imageV: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var imageDownloader: ImageDownloader?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = defaultBackgroundColor
        self.contentView.backgroundColor = defaultBackgroundColor
        self.imageV.layer.cornerRadius = cornerRadius
    }
    
    func configure(_ article: DisplayedArticle) {
        nameLabel.text = article.title
        descriptionLabel.text = article.description
        imageV.image = UIImage(named:"no_image")
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
