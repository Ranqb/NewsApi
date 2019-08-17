//
//  APIService.swift
//  NewsAPI
//
//  Created by Andrey Nedov on 12/08/2019.
//  Copyright © 2019 Andrey Nedov. All rights reserved.
//

import Foundation

class APIService: ServicesProtocol {
    func getTopHeadlines(completion: @escaping (Result<[ArticleModel]?>) -> Void) {
        guard let url = URL(string: baseURL+country+apiKey) else {return}
        URLSession.shared.dataTask(with: url) { (data, response
            , error) in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let news = try decoder.decode(NewsModel.self, from: data)
                completion(Result.success(news.articles))
                
            } catch let err {
                print("Err", err)
            }
            }.resume()
    }
    
}


