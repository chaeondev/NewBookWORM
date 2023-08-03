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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .darkGray
        self.titleLabel.textColor = .white
        
    }

    
}
