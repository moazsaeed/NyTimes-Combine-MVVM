//
//  APIRoute.swift
//  MzPracticeProject
//
//  Created by Moaz Saeed (c) on 17/06/2022.
//

import Foundation

//struct URLPlaceHolders {
//    static let versioon = "{VERSION}"
//    static let sections = "{SECTIONS}"
//    static let lastDays = "{LAST_DAYS}"
//}

public enum APIRoutes: String {
    case mostPopular = "/svc/mostpopular/{VERSION}/mostviewed/{SECTIONS}/{LAST_DAYS}.json"
}
