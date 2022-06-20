//
//  ArticlesApi.swift
//  MzPracticeProject
//
//  Created by Moaz Saeed (c) on 17/06/2022.
//

import Foundation

struct ArticlesApi: APIDataProtocol {
    var parameteres: HTTPParameters?
    
    var path: String
    
    var headers: HTTPHeaders? {
        return nil
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var body: HTTPBody? {
        return nil
    }
    
    init() {
        self.path = APIRoutes.mostPopular.rawValue.replacingOccurrences(of: "{VERSION}", with: APIConstants.API_VERSION)
        self.parameteres = [APIQueryParamKeys.API_KEY :APIConstants.NYTimes_APIKey]
    }
    
    mutating func configure(section:String, lastDays:Int) {
        let pathTemp = self.path.replacingOccurrences(of: "{SECTIONS}", with: section)
        self.path = pathTemp.replacingOccurrences(of: "{LAST_DAYS}", with: String(lastDays))
    }
}
