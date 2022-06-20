//
//  ViewController.swift
//  MzPracticeProject
//
//  Created by Moaz Saeed (c) on 17/06/2022.
//

import UIKit
import Combine



class HomeViewController: UIViewController {
    
    var cancelableObservers:[AnyCancellable] = []
    var homeViewModel = HomeViewModel()
    
    private enum Section:Int {
        case grid
    }
    
    private var articlesDataSource:UITableViewDiffableDataSource<Section, Article.ID>!
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupTableView()
        configureDataSource()
        setupListner()
        fetchData()
//        loadData()
        
    }
    
    func setupTableView() {
        tableView.delegate = self
        
    }
    
    private func loadData(_ articles: [Article]) {
        let items = articles
        let ids = items.map({$0.id})
        var snapshot = NSDiffableDataSourceSnapshot<Section, Article.ID>()
        snapshot.appendSections([.grid])
        snapshot.appendItems(ids, toSection: .grid)
        articlesDataSource.applySnapshotUsingReloadData(snapshot)
    }
    
    func fetchData() {
        
        homeViewModel.fetchArticles()
    }
    
    func setupListner() {
        homeViewModel.articles.sink { [unowned self] articles in
            self.loadData(articles)
        }.store(in: &cancelableObservers)
        
    }
    
    private func configureDataSource() {
        
        articlesDataSource = UITableViewDiffableDataSource(tableView: tableView, cellProvider: { [unowned self] tableView, indexPath, itemIdentifier in
            let item = self.homeViewModel.articles.value.filter( { $0.id == itemIdentifier } ).first
            let cell = tableView.dequeueReusableCell(withIdentifier: ArticleCellViewModel.identifier, for: indexPath)
            let cellViewModel = ArticleCellViewModel(article: item)
            cellViewModel.configure(cell as! ArticleListTableViewCell)
            return cell
        })
    }

}
