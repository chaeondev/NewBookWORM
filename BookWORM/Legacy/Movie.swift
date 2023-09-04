//
//  Movie.swift
//  BOOKWARM
//
//  Created by ChaewonMac on 2023/07/31.
//

import UIKit

struct Movie {
    
    static func randomBackgroundColor() -> UIColor {
            
        let red = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
    
    let title: String
    let releaseDate: String
    let runtime: Int
    let overview: String
    var rate: Double
    var like: Bool = false
    var color: UIColor = randomBackgroundColor()
}

