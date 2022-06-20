//
//  ArticlesResponse.swift
//  MzPracticeProject
//
//  Created by Moaz Saeed (c) on 24/04/2022.
//

import Foundation

struct MostPopularResponse: Codable {
    let articles:[Article]?
    enum ResponseCodingKeys: String, CodingKey {
        case results = "results"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ResponseCodingKeys.self)
        if let articlesTemp = try container.decodeIfPresent([Article].self, forKey: .results) {
            articles = articlesTemp
        } else {
            articles = nil
        }
    }
}
