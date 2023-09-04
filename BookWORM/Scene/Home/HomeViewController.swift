//
//  HomeViewController.swift
//  BookWORM
//
//  Created by ChaewonMac on 2023/09/04.
//

import UIKit
import SnapKit
import RealmSwift

class HomeViewController: BaseViewController {
    
    lazy var collectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
        view.register(NewBookCollectionViewCell.self, forCellWithReuseIdentifier: NewBookCollectionViewCell.reuseIdentifier)
        view.delegate = self
        view.dataSource = self
        view.collectionViewLayout = collectionViewLayout()
        return view
    }()
    
    var books: Results<MyBook>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "My BookShelf"
        navigationController?.navigationBar.tintColor = Constants.BaseColor.text
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(searchButtonClicked))
        navigationItem.rightBarButtonItem?.tintColor = Constants.BaseColor.text
        
        let realm = try! Realm()
        let myBooks = realm.objects(MyBook.self).sorted(byKeyPath: "title", ascending: true)
        books = myBooks
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        collectionView.reloadData()
    }
    
    @objc func searchButtonClicked() {
        let vc = SearchViewController()
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true)
    }
    
    override func configure() {
        super.configure()
        view.addSubview(collectionView)
    }
    
    override func setConstraints() {
        
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return books.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewBookCollectionViewCell.reuseIdentifier, for: indexPath) as? NewBookCollectionViewCell else { return UICollectionViewCell() }
        
        let data = books[indexPath.item]
        
        cell.titleLabel.text = data.title
        cell.authorLabel.text = data.author
        if let url = URL(string: data.coverURL!) {
            cell.bookImage.kf.setImage(with: url)
        }
        return cell
    }
    
    private func collectionViewLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 8
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        let size = UIScreen.main.bounds.width - (spacing * 4)
        let width = size / 3
        let height = width * 1.8
        layout.itemSize = CGSize(width: width, height: height)
        
        return layout
    }
    
    
}
