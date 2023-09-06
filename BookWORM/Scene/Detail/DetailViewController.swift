//
//  DetailViewController.swift
//  BookWORM
//
//  Created by ChaewonMac on 2023/09/05.
//

import UIKit

class DetailViewController: BaseViewController {
    
    let thumbImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    let likeButton = {
        let view = UIButton()
        view.tintColor = Constants.BaseColor.point
        view.setImage(UIImage(systemName: "heart"), for: .normal)
        return view
    }()
    
    let titleLabel = {
        let view = CustomLabel()
        view.font = .boldSystemFont(ofSize: 15)
        return view
    }()
    
    let authorLabel = {
        let view = CustomLabel()
        view.textAlignment = .right
        view.font = .systemFont(ofSize: 14, weight: .semibold)
        return view
    }()
    
    let overViewTitleLabel = {
        let view = CustomLabel()
        view.font = .boldSystemFont(ofSize: 15)
        view.text = "Overview"
        return view
    }()
    
    let overViewLabel = {
        let view = CustomLabel()
        view.font = .systemFont(ofSize: 12)
        return view
    }()
    
    let memoTitleLabel = {
        let view = CustomLabel()
        view.font = .boldSystemFont(ofSize: 15)
        view.text = "Memo"
        return view
    }()
    
    let memoTextView = {
        let view = UITextView()
        view.layer.cornerRadius = 8
        view.layer.borderColor = Constants.BaseColor.border
        view.layer.borderWidth = 1
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func configure() {
        super.configure()
        
        view.addSubview(thumbImageView)
        thumbImageView.addSubview(likeButton)
        view.addSubview(titleLabel)
        view.addSubview(authorLabel)
        view.addSubview(overViewTitleLabel)
        view.addSubview(overViewLabel)
        view.addSubview(memoTitleLabel)
        view.addSubview(memoTextView)
        
    }
    
    override func setConstraints() {
        
        thumbImageView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.height.equalToSuperview().multipliedBy(0.21)
        }
        
        likeButton.snp.makeConstraints { make in
            make.bottom.trailing.equalToSuperview().inset(12)
            make.size.equalTo(40)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(thumbImageView.snp.bottom).offset(12)
            make.leading.equalToSuperview().offset(12)
            make.trailing.equalToSuperview().inset(12)
            make.height.equalToSuperview().multipliedBy(0.04)
        }
        
        authorLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.horizontalEdges.equalToSuperview().inset(12)
            make.height.equalToSuperview().multipliedBy(0.025)
        }
        
        overViewTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(authorLabel.snp.bottom).offset(12)
            make.leading.equalToSuperview().offset(12)
        }
        
        overViewLabel.snp.makeConstraints { make in
            make.top.equalTo(overViewTitleLabel.snp.bottom).offset(6)
            make.horizontalEdges.equalToSuperview().inset(12)
            make.height.equalToSuperview().multipliedBy(0.15)
        }
        
        memoTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(overViewLabel.snp.bottom).offset(12)
            make.leading.equalToSuperview().offset(12)
        }
        
        memoTextView.snp.makeConstraints { make in
            make.top.equalTo(memoTitleLabel.snp.bottom).offset(6)
            make.horizontalEdges.equalToSuperview().inset(12)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
        
    }
}
