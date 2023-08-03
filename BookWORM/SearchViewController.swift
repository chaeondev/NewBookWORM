//
//  SearchViewController.swift
//  BookWORM
//
//  Created by ChaewonMac on 2023/08/04.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let totalList: [Movie] = MovieInfo().list
    var searchList: [Movie] = []
    
    @IBOutlet var mediaSearchBar: UISearchBar!
    @IBOutlet var resultTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mediaSearchBar.delegate = self
        resultTableView.delegate = self
        resultTableView.dataSource = self
        
        title = "검색"
        
        mediaSearchBar.placeholder = "검색어를 입력해주세요"
        mediaSearchBar.showsCancelButton = true
        
        let xmark = UIImage(systemName: "xmark")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: xmark, style: .plain, target: self, action: #selector(closeButtonClicked))
        navigationItem.leftBarButtonItem?.tintColor = .black
    
        let nib = UINib(nibName: SearchTableViewCell.identifier, bundle: nil)
        resultTableView.register(nib, forCellReuseIdentifier: SearchTableViewCell.identifier)
        
        resultTableView.rowHeight = 100
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.identifier) as? SearchTableViewCell else {
            return UITableViewCell()
        }
        
        let row = searchList[indexPath.row]

        cell.titleLabel.text = row.title
        cell.posterImageView.image = UIImage(named: row.title)

        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: DetailViewController.identifier) as! DetailViewController
        vc.movieData = searchList[indexPath.row]
        vc.type = .search
        vc.modalPresentationStyle = .pageSheet
        present(vc, animated: true)
    }
    
    @objc
    func closeButtonClicked() {
        
        dismiss(animated: true)
    }
    
}


extension SearchViewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchList.removeAll()

        for item in totalList {
            if item.title.contains(mediaSearchBar.text!) {
                searchList.append(item)
            }
        }

        resultTableView.reloadData()
    }


    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchList.removeAll()
        mediaSearchBar.text = ""
        resultTableView.reloadData()
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchList.removeAll()

        for item in totalList {
            if item.title.contains(mediaSearchBar.text!) {
                searchList.append(item)
            }
        }
        resultTableView.reloadData()

    }
    
}
