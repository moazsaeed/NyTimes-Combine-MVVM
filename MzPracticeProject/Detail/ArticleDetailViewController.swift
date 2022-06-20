//
//  ArticleDetailViewController.swift
//  MzPracticeProject
//
//  Created by Moaz Saeed (c) on 25/04/2022.
//


import UIKit
import Combine
import Kingfisher

class ArticleDetailViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var snippetLabel: UILabel!
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var dateTimeLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var viewModel = ArticleDetailViewModel()
    var cancelableObservers:[AnyCancellable] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupListeners()
    }
    
    //here setting the listners to receive events for UI UPdate
    func setupListeners() {
        
        viewModel.title.sink { [unowned self] value in
            self.titleLabel.text = value
        }.store(in: &cancelableObservers)
        
        viewModel.snippet.sink { [unowned self] value in
            self.snippetLabel.text = value
        }.store(in: &cancelableObservers)
        
        viewModel.dateTime.sink { [unowned self] value in
            self.dateTimeLabel.text = value
        }.store(in: &cancelableObservers)
        
        viewModel.leadParagraph.sink { [unowned self] value in
            self.detailLabel.text = value
        }.store(in: &cancelableObservers)

        viewModel.imageUrl.sink { [unowned self] value in
            if let imageUrl = URL(string: value) {
                self.articleImageView.setImageWithKF(url: imageUrl)
            }
        }.store(in: &cancelableObservers)

    }

}
