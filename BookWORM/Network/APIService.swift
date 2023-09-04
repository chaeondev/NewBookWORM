//
//  APIService.swift
//  BookWORM
//
//  Created by ChaewonMac on 2023/09/04.
//

import Foundation
import Alamofire

class APIService {
    static let shared = APIService()
    
    private init() {}
    
    func searchBook(query: String, page: Int, completion: @escaping (Book) -> Void ) {
        
        guard let text = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        guard let url = URL(string: "https://dapi.kakao.com/v3/search/book?query=\(text)&size=25&target=title&page=\(page)") else { return }
        let header: HTTPHeaders = ["Authorization": "KakaoAK \(APIKey.kakaoKey)"]
        AF.request(url, headers: header).validate().responseDecodable(of: Book.self) { response in
            switch response.result {
            case .success(let value):
                completion(value)
            case .failure(let error):
                print(error)
            }
        }
    }
}
