//
//  UIImageView+Extension.swift
//  MovieApp2023
//
//  Created by Akın Aksoy on 22.01.2023.
//

import UIKit

extension UIVisualEffectView{
    
    static var setBlurImage: UIVisualEffectView {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.systemThinMaterialDark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)

        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return blurEffectView
    }
}
