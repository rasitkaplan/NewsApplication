//
//  NewsViewModel.swift
//  NewsProject
//
//  Created by Rasit on 17.08.2022.
//

import Foundation

protocol PassToData: AnyObject {
    func passToData(news: NewsModel?)
}

class NewsViewModel {
    weak var delegate: PassToData?

    func getNews() {
        WebService.shared.getNews { (data) in
            self.delegate?.passToData(news: data)
        }
    }
}
