//
//  UIView+Extensions.swift
//  MovieApp2023
//
//  Created by Akın Aksoy on 22.01.2023.
//

import UIKit
extension UIView {

    func bubbleView() -> UIView{
        self.backgroundColor = .setBorderGreyColor
        self.layer.cornerRadius = 16
        return self
    }

}
