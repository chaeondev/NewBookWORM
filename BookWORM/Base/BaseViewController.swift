//
//  BaseViewController.swift
//  BookWORM
//
//  Created by ChaewonMac on 2023/09/04.
//

import UIKit

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        setConstraints()
    }
    
    func configure() {
        view.backgroundColor = Constants.BaseColor.background
    }
    
    func setConstraints() { }
}
