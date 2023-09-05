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

    @IBAction func searchButtonClicked(_ sender: UIBarButtonItem) {

        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
        
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true)
        
    }
    
    
    func setCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        
        let spacing:CGFloat = 16
        let width = UIScreen.main.bounds.width - (spacing * 3)
        
        
        let height = UIScreen.main.bounds.height - (spacing * 4)
        
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
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewBookCollectionViewCell", for: indexPath) as? NewBookCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let row = movie.list[indexPath.row]
        
        //cell.configureCell(row: row)
        
        cell.likeButton.tag = indexPath.row
        //cell.likeButton.addTarget(self, action: #selector(likeButtonClicked), for: .touchUpInside)
        
        return cell
    }
    
    @objc func likeButtonClicked(_ sender: UIButton) {
        movie.list[sender.tag].like.toggle()
    }
    
//    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let sb = UIStoryboard(name: "Main", bundle: nil)
//        let vc = sb.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
//
//        vc.movieData = movie.list[indexPath.item]
//        navigationController?.pushViewController(vc, animated: true)
//    }

}
