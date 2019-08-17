//
//  ImageDownloader.swift
//  NewsAPI
//
//  Created by Andrey Nedov on 12/08/2019.
//  Copyright © 2019 Andrey Nedov. All rights reserved.
//

import Foundation
import UIKit

protocol ImageDownloaderDelegate {
    func didFinishDownloading(_ sender: ImageDownloader)
}


class ImageDownloader {
    var url: URL
    var image:UIImage?
    var delegate: ImageDownloaderDelegate?
    
    init(imageURL:URL) {
        self.url = imageURL
    }
    
    func downloadImage() {
        
        URLSession.shared.dataTask(with: self.url) {
            data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
                self.didDownloadImage()
                //loading.stopAnimating()
            }
            }.resume()
        
    }
    
    func didDownloadImage() {
        self.delegate?.didFinishDownloading(self)
    }
    
}
