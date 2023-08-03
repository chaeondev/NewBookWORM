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

        
    }

    

}
