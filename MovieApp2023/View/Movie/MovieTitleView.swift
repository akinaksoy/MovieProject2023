//
//  MovieTitleView.swift
//  MovieApp2023
//
//  Created by Huawei PC on 20.01.2023.
//

import UIKit

class MovieTitleView: UIView {
    
    private lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .setTextColor
        label.numberOfLines = 3
        label.font = .systemFont(ofSize: 24)
        return label
    }()
    
    private lazy var infoView = MovieInfoView()
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        titleLabel.text = ""
        self.addSubview(titleLabel)
        self.addSubview(infoView)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
        }
        infoView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp_bottomMargin).offset(16)
            make.centerX.equalToSuperview()
            make.width.equalTo(titleLabel)
        }
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure(index : Int) {
        if let movie = MovieManager.shared.movies?.results?[index] {
            titleLabel.text = movie.originalTitle
            if let releaseDate = movie.releaseDate, let voteAverage = movie.voteAverage {
                infoView.configure(dateText: releaseDate, rateText: "\(voteAverage)/10")
            }
        }
    }
    
    
    
    
}
