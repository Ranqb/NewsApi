//
//  NewsModel.swift
//  NewsAPI
//
//  Created by Andrey Nedov on 12/08/2019.
//  Copyright © 2019 Andrey Nedov. All rights reserved.
//

import Foundation

struct NewsModel: Decodable {
    let status: String
    let totalResults: Int
    let articles: [ArticleModel]
}

