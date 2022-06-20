//
//  LaunchListTableViewCellViewModel.swift
//  MzPracticeProject
//
//  Created by Moaz Saeed (c) on 22/04/2022.
//

import Foundation
import Combine

class ArticleCellViewModel {
    
    static let identifier = "ArticleListTableViewCell"
    
    var cellIdentifier = "ArticleListTableViewCell"
    var article:Article?
    var title = CurrentValueSubject<String, Never>("")
    var snippet = CurrentValueSubject<String, Never>("")
    var imageUrl = CurrentValueSubject<String, Never>("")
    var dateTime = CurrentValueSubject<String, Never>("")
    
    init() {}
    
    required convenience init(article: Article?) {
        self.init()
        guard let article = article else {
            return
        }

        self.article = article
        title.send(self.article?.title ?? "")
        snippet.send(self.article?.abstract ?? "")
        dateTime.send(self.article?.date ?? "")
        
        if let mediaItem = article.media, mediaItem.count > 0, let metadata = mediaItem[0].mediaMetadata {
            if let item = metadata.filter( { $0.format == "mediumThreeByTwo440" }).first, let urlPath = item.url {
                imageUrl.send(urlPath)
            }
        }
        
    }
    
    public func configure(_ cell: ArticleListTableViewCell) {
        cell.viewModel = self
        cell.setupListeners()
    }
}
