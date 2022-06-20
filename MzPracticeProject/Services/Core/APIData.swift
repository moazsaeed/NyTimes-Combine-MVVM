//
//  APIData.swift
//  MzPracticeProject
//
//  Created by Moaz Saeed (c) on 17/06/2022.
//

import Foundation


protocol APIDataProtocol {
    
    var baseURL: String { get }
    
    var path: String { get set }
    
    var parameteres: HTTPParameters?{ get set }
    
    var headers: HTTPHeaders? { get }
    
    var method: HTTPMethod { get }
    
    var body: HTTPBody? { get }
    
    init (parameters: HTTPParameters?)
    
}

extension APIDataProtocol {
    
    
    var baseURL: String {
        return APIConstants.API_BASE_URL
    }
    //mixin
    init (parameters: HTTPParameters? = nil) {
        self.init(parameters: parameters)
    }
}


