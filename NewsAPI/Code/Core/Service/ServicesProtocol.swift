//
//  ServicesProtocol.swift
//  NewsAPI
//
//  Created by Andrey Nedov on 12/08/2019.
//  Copyright © 2019 Andrey Nedov. All rights reserved.
//

import Foundation
protocol ServicesProtocol {
    func getTopHeadlines(completion: @escaping (Result<[ArticleModel]?>) -> Void)
}
