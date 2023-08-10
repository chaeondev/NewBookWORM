//
//  SearchTableViewCell.swift
//  BookWORM
//
//  Created by ChaewonMac on 2023/08/04.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    
    static let identifier = "SearchTableViewCell"

    @IBOutlet var posterImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var contentsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        designCell()
        
    }

    func designCell() {
        
        self.backgroundColor = .darkGray
        
        titleLabel.textColor = .white
        titleLabel.font = .boldSystemFont(ofSize: 15)
        
        posterImageView.contentMode = .scaleAspectFit
        
        authorLabel.textAlignment = .right
        authorLabel.textColor = .systemGray6
        authorLabel.font = .systemFont(ofSize: 13)
        
        contentsLabel.textAlignment = .center
        contentsLabel.font = .systemFont(ofSize: 11)
        contentsLabel.numberOfLines = 0
        contentsLabel.textColor = .white
        
    }
}
