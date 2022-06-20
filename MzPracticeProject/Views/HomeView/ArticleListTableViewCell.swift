//
//  LaunchListTableViewCell.swift
//  MzPracticeProject
//
//  Created by Moaz Saeed (c) on 22/04/2022.
//

import UIKit
import Combine
import Kingfisher

class ArticleListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var snippetLabel: UILabel!
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var dateTimeLabel: UILabel!
    
    
    var viewModel: ArticleCellViewModel = ArticleCellViewModel()

    var cancelableObservers:[AnyCancellable] = []
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setup()
    }

    func setup() {
        setupViews()
        setupListeners()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    public override func prepareForReuse() {
        super.prepareForReuse()
        self.articleImageView.image = UIImage(named: "sample0")
    }

    private func setupViews() {
        selectionStyle = .none
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

        viewModel.imageUrl.sink { [unowned self] value in
            if let imageUrl = URL(string: value) {
                self.articleImageView.setImageWithKF(url: imageUrl)
            }
        }.store(in: &cancelableObservers)

    }

}
