//
//  Label.swift
//  MovieApp2023
//
//  Created by Akın Aksoy on 22.01.2023.
//

import UIKit


extension UILabel {

    func bubbleLabel(text: String?, fontSize: CGFloat) -> UILabel{
        
        self.text = text ?? ""
        self.font = .boldSystemFont(ofSize: fontSize)
        self.textColor = .setbuttonColor
        self.numberOfLines = 0
        self.textAlignment = .center
        return self
    }

    func titleLabel(text: String?, fontSize: CGFloat) -> UILabel{
        
        self.text = text ?? ""
        self.font = .boldSystemFont(ofSize: fontSize)
        self.textColor = .setTextColor
        self.numberOfLines = 0
        self.textAlignment = .center
        return self
    }
    
    
    
}
