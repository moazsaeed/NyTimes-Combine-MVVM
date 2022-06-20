//
//  Article.swift
//  MzPracticeProject
//
//  Created by Moaz Saeed (c) on 24/04/2022.
//

import Foundation

struct Article: Codable, Identifiable {
    let id = UUID()
    let title:String?
    let abstract:String?
    let byline:String?
    let date:String?
    let media:[Media]?
    let adxKeywords:String?
    
    enum CodingKeys: String, CodingKey {
        
        case title = "title"
        case abstract = "abstract"
        case byline = "byline"
        case date = "published_date"
        case media = "media"
        case adxKeywords = "adx_keywords"
    }
    
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decodeIfPresent(String.self, forKey: .title)
        abstract = try container.decodeIfPresent(String.self, forKey: .abstract)
        byline = try container.decodeIfPresent(String.self, forKey: .byline)
        adxKeywords = try container.decodeIfPresent(String.self, forKey: .adxKeywords)
        date = try container.decodeIfPresent(String.self, forKey: .date)
        media = try container.decodeIfPresent([Media].self, forKey: .media)
    }
    
}
