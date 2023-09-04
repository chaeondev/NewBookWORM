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
        let view = CustomLabel()
        view.backgroundColor = .cyan
        view.font = .systemFont(ofSize: 12, weight: .semibold)
        return view
    }()
    
    let authorLabel = {
        let view = CustomLabel()
        view.backgroundColor = .gray
        view.font = .systemFont(ofSize: 10)
        return view
    }()
    
    let likeButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "heart"), for: .normal)
        view.tintColor = Constants.BaseColor.point
        return view
    }()
    
    override func configure() {
        contentView.addSubview(bookImage)
        contentView.addSubview(infoView)
        infoView.addSubview(titleLabel)
        infoView.addSubview(authorLabel)
        bookImage.addSubview(likeButton)
        
    }
    
    override func setConstraints() {
        bookImage.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.75)
        }
        
        infoView.snp.makeConstraints { make in
            make.top.equalTo(bookImage.snp.bottom)
            make.bottom.horizontalEdges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().inset(4)
            make.trailing.greaterThanOrEqualToSuperview().inset(4)
            make.height.equalToSuperview().multipliedBy(0.5)
        }
        authorLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.horizontalEdges.equalToSuperview().inset(4)
            make.height.equalToSuperview().multipliedBy(0.3)
            
        }
        likeButton.snp.makeConstraints { make in
            make.bottom.trailing.equalToSuperview().inset(12)
            make.size.equalTo(20)
        }
        
    }
    
    
}
