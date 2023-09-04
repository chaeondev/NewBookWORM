//
//  ResultTableViewCell.swift
//  BookWORM
//
//  Created by ChaewonMac on 2023/09/04.
//

import UIKit
import SnapKit

class ResultTableViewCell: BaseTableViewCell {
    
    let coverImageView = {
        let view = PhotoImageView(frame: .zero)
        return view
    }()
    
    let titleLabel = {
        let view = CustomLabel()
        view.font = .boldSystemFont(ofSize: 15)
        return view
    }()
    
    let authorLabel = {
        let view = CustomLabel()
        view.font = .systemFont(ofSize: 13, weight: .semibold)
        return view
    }()
    
    let priceLabel = {
        let view = CustomLabel()
        view.font = .systemFont(ofSize: 12)
        view.textAlignment = .right
        return view
    }()
    
    let contentsLabel = {
        let view = CustomLabel()
        view.font = .systemFont(ofSize: 12)
        return view
    }()
    
    
    override func configure() {
        contentView.addSubview(coverImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(authorLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(contentsLabel)
    }
    
    override func setConstraints() {
        
        coverImageView.snp.makeConstraints { make in
            make.verticalEdges.leading.equalToSuperview().inset(8)
            make.width.equalTo(self.coverImageView.snp.height).multipliedBy(0.65)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.leading.equalTo(coverImageView.snp.trailing).offset(12)
            make.trailing.equalToSuperview().inset(12)
            make.height.equalToSuperview().multipliedBy(0.2)
        }
        authorLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.leading.equalTo(coverImageView.snp.trailing).offset(12)
            make.width.equalToSuperview().multipliedBy(0.4)
            make.height.equalToSuperview().multipliedBy(0.15)
        }
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.trailing.equalToSuperview().inset(12)
            make.leading.equalTo(authorLabel.snp.trailing)
            make.height.equalToSuperview().multipliedBy(0.10)
            make.centerY.equalTo(authorLabel.snp.centerY)
        }
        contentsLabel.snp.makeConstraints { make in
            make.top.equalTo(authorLabel.snp.bottom).offset(8)
            make.leading.equalTo(coverImageView.snp.trailing).offset(12)
            make.trailing.equalToSuperview().inset(12)
            make.bottom.lessThanOrEqualToSuperview().inset(8)
        }
        
    }
}

