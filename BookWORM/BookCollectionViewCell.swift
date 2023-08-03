//
//  BookCollectionViewCell.swift
//  BookWORM
//
//  Created by ChaewonMac on 2023/08/04.
//

import UIKit

class BookCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var posterImageView: UIImageView!
    @IBOutlet var rateLabel: UILabel!
    @IBOutlet var likeButton: UIButton!

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setCell()
        setNameLabel()
        setPoster()
        setRateLabel()
        
    }

    func configureCell(row: Movie) {
        nameLabel.text = row.title
        posterImageView.image = UIImage(named: row.title)
        rateLabel.text = "★ \(row.rate)"
        
        let like = row.like ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart")
        likeButton.setImage(like, for: .normal)
        
        self.backgroundColor = row.color
    }
    
    func setCell() {
        self.layer.cornerRadius = 10
    }
    
    func setNameLabel() {
        nameLabel.numberOfLines = 0
        nameLabel.textColor = .white
        nameLabel.font = .systemFont(ofSize: 20, weight: .heavy)
        nameLabel.textAlignment = .right
    }
    
    func setPoster() {
        posterImageView.contentMode = .scaleAspectFill
        posterImageView.layer.cornerRadius = 10
    }
    
    func setRateLabel() {
        rateLabel.textColor = .white
        rateLabel.font = .systemFont(ofSize: 15, weight: .semibold)
    }
    
    
    
}
