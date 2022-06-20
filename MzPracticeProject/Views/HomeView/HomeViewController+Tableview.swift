//
//  HomeViewController+Tableview.swift
//  MzPracticeProject
//
//  Created by Moaz Saeed (c) on 19/06/2022.
//

import UIKit

extension HomeViewController: UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let articles = self.homeViewModel.articles.value
        if articles.count > indexPath.row {
            let article = articles[indexPath.row]
            let articleDetailVC = ArticleDetailViewController.instanceFromStoryboard()
            articleDetailVC.viewModel = ArticleDetailViewModel(article: article)
            navigationController?.pushViewController(articleDetailVC, animated: true)
        }
        
    }
}
