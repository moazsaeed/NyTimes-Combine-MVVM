//
//  ArticleDetailViewModel.swift
//  MzPracticeProject
//
//  Created by Moaz Saeed (c) on 25/04/2022.
//

import Foundation
import Combine

class ArticleDetailViewModel {
    var article:Article?// = CurrentValueSubject<Article?, Never>(nil)
    var title = CurrentValueSubject<String, Never>("")
    var snippet = CurrentValueSubject<String, Never>("")
    var imageUrl = CurrentValueSubject<String, Never>("")
    var dateTime = CurrentValueSubject<String, Never>("")
    var leadParagraph = CurrentValueSubject<String, Never>("")
    
    
    init() {}
    
    required convenience init(article: Article) {
        self.init()
        processArticle(article)
    }
    
    func processArticle(_ article: Article?) {
        
        guard let article = article else {
            return
        }
        
        self.article = article
        
        title.send(article.title ?? "")
        snippet.send(article.abstract ?? "")
        dateTime.send(article.date ?? "")
        leadParagraph.send(article.adxKeywords ?? "")
        
        if let mediaItem = article.media, mediaItem.count > 0, let metadata = mediaItem[0].mediaMetadata {
            if let item = metadata.filter( { $0.format == "mediumThreeByTwo440" }).first, let urlPath = item.url {
                imageUrl.send(urlPath)
            }
        }
    }
}
