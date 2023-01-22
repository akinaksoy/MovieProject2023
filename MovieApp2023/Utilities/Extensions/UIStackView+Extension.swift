//
//  UIStackView+Extension.swift
//  MovieApp2023
//
//  Created by Akın Aksoy on 22.01.2023.
//

import UIKit
extension UIStackView {

    func horizontalStackView() -> UIStackView{
        self.axis = NSLayoutConstraint.Axis.horizontal
        self.distribution = UIStackView.Distribution.equalSpacing
        self.alignment = UIStackView.Alignment.center
        return self
    }
    
    func verticalStackView() -> UIStackView{
        self.axis = NSLayoutConstraint.Axis.horizontal
        self.distribution = UIStackView.Distribution.equalSpacing
        self.alignment = UIStackView.Alignment.center
        return self
    }

}
