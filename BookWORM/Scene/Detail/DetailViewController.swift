//
//  DetailViewController.swift
//  BookWORM
//
//  Created by ChaewonMac on 2023/09/05.
//

import UIKit
import RealmSwift

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
    
    let realm = try! Realm()
    
    var data: MyBook?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isToolbarHidden = false
        self.navigationController?.toolbar.tintColor = Constants.BaseColor.point
        let editButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editButtonClicked))
        let deleteButton = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(deleteButtonClicked))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        
        self.toolbarItems = [editButton, flexibleSpace, deleteButton]
        
        
    }
    
    @objc func editButtonClicked() {
        
        guard let data = data else { return }
        
        do {
            try realm.write {
                realm.create(MyBook.self, value: ["_id": data._id, "memo": memoTextView.text ?? ""], update: .modified)
            }
        } catch {
            print(error)
        }
    }
    
    @objc func deleteButtonClicked() {
        
        guard let data = data else { return }
        
        removeImageFromDocument(fileName: "\(data._id).jpg")
        
        do {
            try realm.write {
                realm.delete(data)
            }
        } catch {
            print(error)
        }
        
        navigationController?.popViewController(animated: true)
        
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
