//
//  ArticleMedia.swift
//  MzPracticeProject
//
//  Created by Moaz Saeed (c) on 25/04/2022.
//

import Foundation

struct Media : Codable {
    let type : String?
    let subtype : String?
    let mediaMetadata : [MediaMetadata]?

    enum CodingKeys: String, CodingKey {

        case type = "type"
        case subtype = "subtype"
        case mediaMetadata = "media-metadata"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        subtype = try values.decodeIfPresent(String.self, forKey: .subtype)
        mediaMetadata = try values.decodeIfPresent([MediaMetadata].self, forKey: .mediaMetadata)
    }

}

struct MediaMetadata : Codable {
    let url : String?
    let format : String?
    let height : Int?
    let width : Int?

    enum CodingKeys: String, CodingKey {

        case url = "url"
        case format = "format"
        case height = "height"
        case width = "width"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        format = try values.decodeIfPresent(String.self, forKey: .format)
        height = try values.decodeIfPresent(Int.self, forKey: .height)
        width = try values.decodeIfPresent(Int.self, forKey: .width)
    }

}
