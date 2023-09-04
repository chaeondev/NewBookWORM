//
//  CustomLabel.swift
//  BookWORM
//
//  Created by ChaewonMac on 2023/09/04.
//

import UIKit

class CustomLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        textColor = Constants.BaseColor.text
        numberOfLines = 0
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
