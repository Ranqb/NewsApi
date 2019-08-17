//
//  ArticleModel.swift
//  NewsAPI
//
//  Created by Andrey Nedov on 12/08/2019.
//  Copyright © 2019 Andrey Nedov. All rights reserved.
//

import Foundation

struct ArticleModel: Decodable{
    
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
    let source: Source?
    
    struct Source: Decodable{
        let id: String?
        let name: String?
    }
}
