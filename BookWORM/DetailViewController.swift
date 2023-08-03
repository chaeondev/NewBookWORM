//
//  DetailViewController.swift
//  BookWORM
//
//  Created by ChaewonMac on 2023/08/04.
//

import UIKit

enum TransitionType {
    case collection
    case search
    case discover
}

class DetailViewController: UIViewController {
    
    static let identifier = "DetailViewController"
    
    var movieData: Movie?
    
    var type: TransitionType = .collection

    @IBOutlet var detailPosterImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var releaseDateLabel: UILabel!
    @IBOutlet var rateLabel: UILabel!
    @IBOutlet var storyLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        storyLabel.numberOfLines = 0
        storyLabel.translatesAutoresizingMaskIntoConstraints = false
        
        guard let movieData else { return }
        setMovieData(movieData: movieData)
        
    }
    
    func setMovieData(movieData: Movie) {
        
        detailPosterImageView.image = UIImage(named: movieData.title)
        titleLabel.text = movieData.title
        releaseDateLabel.text = movieData.releaseDate
        rateLabel.text = "평점 ★ \(movieData.rate)점"
        storyLabel.text = movieData.overview
    }
    
}
