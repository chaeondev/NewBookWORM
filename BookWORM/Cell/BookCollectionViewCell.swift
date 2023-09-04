//
//  BookCollectionViewCell.swift
//  BookWORM
//
//  Created by ChaewonMac on 2023/09/04.
//

import UIKit

class NewBookCollectionViewCell: BaseCollectionViewCell {
    
    let bookImage = {
        let view = PhotoImageView(frame: .zero)
        view.backgroundColor = .brown
        return view
    }()
    
    let infoView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    let titleLabel = {
        let view = UILabel()
        view.backgroundColor = .cyan
        view.textColor = Constants.BaseColor.text
        view.font = .systemFont(ofSize: 12, weight: .semibold)
        return view
    }()
    
    override func configure() {
        
    }
    
    override func setConstraints() {
        
    }
    
    
}
