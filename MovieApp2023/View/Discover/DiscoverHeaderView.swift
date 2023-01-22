//
//  DiscoverHeaderView.swift
//  MovieApp2023
//
//  Created by Akın Aksoy on 20.01.2023.
//

import UIKit
import SnapKit

protocol DiscoverHeaderViewDataSource {
    func setMovieBannerImage(_ image: String)
}

class DiscoverHeaderView: UIView {

    lazy var nowShowingButton : UIButton = {
        let button = UIButton()
        button.setTitle("Now Showing", for: .normal)
        button.layer.cornerRadius = 5
        button.backgroundColor = .setbuttonColor
        return button
    }()

    lazy var comingSoonButton : UIButton = {
        let button = UIButton()
        button.setTitle("Coming Soon", for: .normal)
        button.layer.cornerRadius = 5
        button.backgroundColor = .setbuttonColor
        return button
    }()
    
    lazy var buttonStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = NSLayoutConstraint.Axis.horizontal
        stackView.distribution = UIStackView.Distribution.equalSpacing
        stackView.alignment = UIStackView.Alignment.center
        return stackView
    }()
    lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.backgroundColor = .clear
        
        let effect = UIVisualEffectView.setBlurImage
        imageView.addSubview(effect)
        return imageView
    }()
    
    var viewHeight : Int = 0
    var viewWidth : Int = 0
    
    private lazy var movieBanner : DiscoverMovieView = {
       var movieBanner = DiscoverMovieView()
        movieBanner.headerDelegate = self
        return movieBanner
    }()
    var selectedMovie : String?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        
        configure()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure() {
        self.addSubview(backgroundImageView)
        
        buttonStackView.addArrangedSubview(nowShowingButton)
        buttonStackView.addArrangedSubview(comingSoonButton)
        self.addSubview(buttonStackView)
        
        self.addSubview(movieBanner)
        buttonStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.safeAreaLayoutGuide).offset(32)
            make.width.equalToSuperview().multipliedBy(0.6)
            make.height.equalToSuperview().multipliedBy(0.2)
        }
        movieBanner.snp.makeConstraints { make in
            make.top.equalTo(buttonStackView.snp_bottomMargin).offset(16)
            make.trailing.leading.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        backgroundImageView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide)
            make.width.equalToSuperview()
            make.height.equalToSuperview()
            
        }
    }
    
    public func setImages(_ images : [String]) {
        movieBanner.setBannerImages(images)
    }
    
    
}

extension DiscoverHeaderView : DiscoverHeaderViewDataSource {
    func setMovieBannerImage(_ image: String) {
        backgroundImageView.image = nil
        backgroundImageView.setImage(imageUrl: image)
    }
    
    
}
