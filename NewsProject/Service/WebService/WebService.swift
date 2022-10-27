//
//  WebService.swift
//  NewsProject
//
//  Created by Rasit on 17.08.2022.
//

import Foundation
import Alamofire

class WebService {
    static let shared = WebService()
    
    func getNews(completion: @escaping (NewsModel?) -> ()) {
        
        let parameters: Parameters = [
                "q" : "keyword",
                "apiKey": "f05d2ba656544bf8ba85c6ffbe235510"
              ]
        AF.request(Constants.shared.baseUrl, method: .get,
                   parameters: parameters,
                   encoding: URLEncoding(destination: .queryString)).response { (response) in
            if let data = response.data {
                do {
                    let newsJson = try JSONDecoder.init().decode(NewsModel.self, from: data)
                    completion(newsJson)
                    print(newsJson)
                } catch {
                    print(error.localizedDescription)
                    print(error)
                    completion(nil)
                }
            }
        }
    }
}

