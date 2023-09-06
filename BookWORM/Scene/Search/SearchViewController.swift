//
//  SearchViewController.swift
//  BookWORM
//
//  Created by ChaewonMac on 2023/09/04.
//

import UIKit
import RealmSwift

class SearchViewController: BaseViewController {
    
    lazy var searchBar = {
        let view = UISearchBar()
        view.placeholder = "책 제목을 입력해주세요"
        view.showsCancelButton = true 
        view.delegate = self
        return view
    }()
    
    lazy var tableView = {
        let view = UITableView()
        view.rowHeight = 165
        view.register(ResultTableViewCell.self, forCellReuseIdentifier: ResultTableViewCell.reuseIdentifier)
        view.delegate = self
        view.dataSource = self
        view.prefetchDataSource = self
        view.keyboardDismissMode = .onDrag
        return view
    }()
    
    var page = 1
    var bookList: Book = Book(documents: [], meta: Meta(isEnd: false, pageableCount: 0, totalCount: 0))
    var isEnd = false
    
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Search Books"
        
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.tintColor = Constants.BaseColor.text
        
        let xmark = UIImage(systemName: "xmark")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: xmark, style: .plain, target: self, action: #selector(closeButtonClicked))
        navigationItem.leftBarButtonItem?.tintColor = Constants.BaseColor.text
        
        print(realm.configuration.fileURL)
        
    }
    
    @objc
    func closeButtonClicked() {
        dismiss(animated: true)
    }
    
    override func configure() {
        view.addSubview(searchBar)
        view.addSubview(tableView)
    }
    
    override func setConstraints() {
        searchBar.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
        }
        tableView.snp.makeConstraints { make in
            make.bottom.horizontalEdges.equalToSuperview()
            make.top.equalTo(searchBar.snp.bottom)
        }
    }
    
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource, UITableViewDataSourcePrefetching {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookList.documents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ResultTableViewCell.reuseIdentifier) as? ResultTableViewCell else { return UITableViewCell()}
        
        let data = bookList.documents[indexPath.row]
        
        cell.coverImageView.kf.setImage(with: URL(string: data.thumbnail))
        cell.titleLabel.text = data.title
        cell.authorLabel.text = data.authors.joined(separator: " , ")
        cell.priceLabel.text = "\(data.price)원"
        cell.contentsLabel.text = data.contents
        return cell
    }
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        for indexPath in indexPaths {
            if bookList.documents.count - 1 == indexPath.row && page < 50 && !isEnd {
                page += 1
                APIService.shared.searchBook(query: searchBar.text!, page: page) { data in
                    print(data)
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let data = MyBook(title: bookList.documents[indexPath.row].title, author: bookList.documents[indexPath.row].authors.joined(separator: " , "), coverURL: bookList.documents[indexPath.row].thumbnail, overview: bookList.documents[indexPath.row].contents, memo: nil, like: false)
        
        try! realm.write {
            realm.add(data)
            print("Realm Add Succeed")
        }

        let value = URL(string: data.coverURL ?? "")
        DispatchQueue.global().async {
            if let url = value, let item = try? Data(contentsOf: url) {
                guard let image = UIImage(data: item) else { return }
                DispatchQueue.main.async {
                    self.saveImageToDocument(fileName: "\(data._id).jpg", image: image)
                }
            }
        }
   
    }
    
    
}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let query = searchBar.text else { return }
        APIService.shared.searchBook(query: query, page: page) { data in
            self.bookList = data
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        bookList.documents.removeAll()
        tableView.reloadData()
    }
}

// MARK: 키보드 내리는 거 구현하기
