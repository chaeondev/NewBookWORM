//
//  BookWormCollectionViewController.swift
//  BookWORM
//
//  Created by ChaewonMac on 2023/08/04.
//

import UIKit

private let reuseIdentifier = "Cell"

class BookWormCollectionViewController: UICollectionViewController {
    
    var movie = MovieInfo() {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "BookCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "BookCollectionViewCell")
        
        setCollectionViewLayout()
        
    }

    func setCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        
        let spacing:CGFloat = 16
        let width = UIScreen.main.bounds.width - (spacing * 3)
        
        guard let tabBarHeight = self.tabBarController?.tabBar.frame.height else { return }
        guard let naviHeight = self.navigationController?.navigationBar.frame.height else { return }
        let height = UIScreen.main.bounds.height - tabBarHeight - naviHeight - (spacing * 4)
        
        layout.itemSize = CGSize(width: width / 2, height: height / 3)
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        
        collectionView.collectionViewLayout = layout
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movie.list.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookCollectionViewCell", for: indexPath) as? BookCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let row = movie.list[indexPath.row]
        
        cell.configureCell(row: row)
        
        cell.likeButton.tag = indexPath.row
        cell.likeButton.addTarget(self, action: #selector(likeButtonClicked), for: .touchUpInside)
        
        return cell
    }
    
    @objc func likeButtonClicked(_ sender: UIButton) {
        movie.list[sender.tag].like.toggle()
    }

}
