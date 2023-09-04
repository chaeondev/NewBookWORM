//
//  HomeViewController.swift
//  BookWORM
//
//  Created by ChaewonMac on 2023/09/04.
//

import UIKit
import SnapKit

class HomeViewController: BaseViewController {
    
    lazy var collectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
        view.backgroundColor = .lightGray
        view.register(NewBookCollectionViewCell.self, forCellWithReuseIdentifier: NewBookCollectionViewCell.reuseIdentifier)
        view.delegate = self
        view.dataSource = self
        view.collectionViewLayout = collectionViewLayout()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewBookCollectionViewCell.reuseIdentifier, for: indexPath) as? NewBookCollectionViewCell else { return UICollectionViewCell() }
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
        let height = width * 1.7
        layout.itemSize = CGSize(width: width, height: height)
        
        return layout
    }
    
    
}
