//
//  RealmModel.swift
//  BookWORM
//
//  Created by ChaewonMac on 2023/09/04.
//

import Foundation
import RealmSwift

class MyBook: Object {
    @Persisted var title: String
    @Persisted var author: String
    @Persisted var coverURL: String?
    @Persisted var like: Bool
    
    convenience init(title: String, author: String, coverURL: String?, like: Bool) {
        self.init()
        
        self.title = title
        self.author = author
        self.coverURL = coverURL
        self.like = like
    }
    
}
