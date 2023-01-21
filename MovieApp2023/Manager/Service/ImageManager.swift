//
//  ImageManager.swift
//  MovieApp2023
//
//  Created by Akın Aksoy on 21.01.2023.
//

import UIKit
import Kingfisher


extension UIImageView {
    func setImage(imageUrl : String) {
        DispatchQueue.main.async {
            let imageURL = URL.init(string: imageUrl)
            KF.url(imageURL).set(to: self)
        }
        
    }
}
