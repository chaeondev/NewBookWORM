//
//  ReusableProtocol.swift
//  BookWORM
//
//  Created by ChaewonMac on 2023/09/04.
//

import UIKit

protocol ReusableViewProtocol: AnyObject {
    static var reuseIdentifier: String { get }
    
}

extension UIViewController: ReusableViewProtocol {
    static var reuseIdentifier: String { // public 사용이 맞아? 고민하고 지우기 -> 한 모듈안에서 쓸거면 필요X
        return String(describing: self)
    }
}

extension UICollectionViewCell: ReusableViewProtocol {
    public static var reuseIdentifier: String {
        return String(describing: self)
    }
}
extension UITableViewCell: ReusableViewProtocol {
    public static var reuseIdentifier: String {
        return String(describing: self)
    }
}
