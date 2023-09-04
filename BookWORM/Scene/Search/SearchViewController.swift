//
//  SearchViewController.swift
//  BookWORM
//
//  Created by ChaewonMac on 2023/09/04.
//

import UIKit

class SearchViewController: BaseViewController {
    
    lazy var searchBar = {
        let view = UISearchBar()
        view.placeholder = "책 제목을 입력해주세요"
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
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ResultTableViewCell.reuseIdentifier) as? ResultTableViewCell else { return UITableViewCell()}
        return cell
    }
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        
    }
    
    
}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
    }
}
