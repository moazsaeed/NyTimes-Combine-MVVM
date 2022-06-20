//
//  HomeViewModel.swift
//  MzPracticeProject
//
//  Created by Moaz Saeed (c) on 17/06/2022.
//

import Foundation
import Combine


class HomeViewModel {
    
    var articles = CurrentValueSubject<[Article], Never>([Article]())
    
    var cancelableObservers:[AnyCancellable] = []
    
    func fetchArticles() {
        fetchArticlesFor(section: "all-sections", lastDays: 7)
    }
    
    private func fetchArticlesFor(section: String, lastDays: Int) {
        var api = ArticlesApi()
        api.configure(section: section, lastDays: lastDays)
        let apiclient = APIClient()
        
        apiclient.fetch(MostPopularResponse.self, api: api)
            .receive(on: DispatchQueue.main)
            .sink { [unowned self] completion in
                debugPrint("result = \(completion)")
                switch completion {
                case .finished:
                    debugPrint("finished")
                case .failure(let error):
                    debugPrint("eror: \(error)")
                    self.articles.send([Article]())
                }
            } receiveValue: { [unowned self] respone in
                self.articles.send(respone.articles ?? [Article]())
            }.store(in: &cancelableObservers)
    }
    
}

