//
//  Label.swift
//  MovieApp2023
//
//  Created by Akın Aksoy on 22.01.2023.
//

import UIKit


extension UILabel {

    func setLabel(text: String?, fontSize: CGFloat,fontColor : UIColor) -> UILabel{
        
        self.text = text ?? ""
        self.font = .boldSystemFont(ofSize: fontSize)
        self.textColor = fontColor
        self.numberOfLines = 0
        self.textAlignment = .center
        return self
    }
}
