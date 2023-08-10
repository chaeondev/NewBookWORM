//
//  SearchViewController.swift
//  BookWORM
//
//  Created by ChaewonMac on 2023/08/04.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher

class SearchViewController: UIViewController {
    
//    let totalList: [Movie] = MovieInfo().list
//    var searchList: [Movie] = []
    
    var bookList: [Book] = []
    var page = 1
    var isEnd = false
    
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
        
        resultTableView.rowHeight = 150
        
        callRequest(query: "아이", page: 1)
        
        
    }
    
    @objc
    func closeButtonClicked() {
        
        dismiss(animated: true)
    }
    
    func callRequest(query: String, page: Int) {
        
        guard let text = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        let url = "https://dapi.kakao.com/v3/search/book?query=\(text)&size=25&target=title&page=\(page)"
        let header: HTTPHeaders = ["Authorization": "KakaoAK \(APIKey.kakaoKey)"]
        
        AF.request(url, method: .get, headers: header).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                
                for item in json["documents"].arrayValue {
                    let bookName = item["title"].stringValue
                    let bookStory = item["contents"].stringValue
                    let bookImage = item["thumbnail"].stringValue
                    var bookAuthor: [String] = []
                    for author in item["authors"].arrayValue {
                        bookAuthor.append(author.stringValue)
                    }
                    
                    let data = Book(title: bookName, image: bookImage, authors: bookAuthor, contents: bookStory)
                    self.bookList.append(data)
                }
                self.resultTableView.reloadData()
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.identifier) as? SearchTableViewCell else {
            return UITableViewCell()
        }
        
        let row = bookList[indexPath.row]
        cell.titleLabel.text = row.title
        cell.authorLabel.text = row.authors.joined(separator: " , ")
        cell.contentsLabel.text = row.contents
        cell.posterImageView.kf.setImage(with: URL(string: row.image))
        
        return cell
    }
/*
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: DetailViewController.identifier) as! DetailViewController
        vc.movieData = searchList[indexPath.row]
        vc.type = .search
        vc.modalPresentationStyle = .pageSheet
        present(vc, animated: true)
    }
 */
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let query = mediaSearchBar.text else { return }
        callRequest(query: query, page: page)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        mediaSearchBar.text = ""
        resultTableView.reloadData()
    }
    
}


/*
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
 */


