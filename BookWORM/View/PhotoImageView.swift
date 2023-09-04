//
//  PhotoImageView.swift
//  BookWORM
//
//  Created by ChaewonMac on 2023/09/04.
//

import UIKit

class PhotoImageView: UIImageView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentMode = .scaleAspectFill
        clipsToBounds = true
        layer.cornerRadius = 10
        layer.borderWidth = 1
        layer.borderColor = Constants.BaseColor.border
        
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
