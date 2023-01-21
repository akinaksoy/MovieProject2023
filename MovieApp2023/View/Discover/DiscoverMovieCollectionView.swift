//
//  DiscoverMovieCollectionView.swift
//  MovieApp2023
//
//  Created by Akın Aksoy on 21.01.2023.
//

import UIKit
class DiscoverMovieCollectionView: UICollectionViewCell {
    static let cellIdentifier = "DiscoverMovieCollectionView"
    
    private var cardHeight = Int(UIScreen.main.bounds.height)/3
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    
    override init(frame : CGRect){
        super.init(frame: frame)
        self.addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.height.equalTo(self.cardHeight)
            make.center.equalToSuperview()
            make.trailing.leading.equalToSuperview().inset(24)
        }
    }
    
    required init(coder : NSCoder){
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.layoutIfNeeded()
        DispatchQueue.main.async {
            self.imageView.layer.cornerRadius = 32
            self.imageView.clipsToBounds = true
        }
    }
    
    func setImage(_ imageString : String) {
        imageView.setImage(imageUrl: imageString)
    }
    
    
    
    
    
    
    
}
