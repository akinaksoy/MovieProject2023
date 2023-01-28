//
//  MovieDetailViewController.swift
//  MovieApp2023
//
//  Created by Akın Aksoy on 23.01.2023.
//

import UIKit

class MovieDetailViewController: BaseViewController {

    
    let trailerView = TrailerView()
    
    let movieDetailArea : UIView = {
       let infoArea = UIView()
        infoArea.backgroundColor = .setBackgroundColor
        infoArea.layer.cornerRadius = 12
        return infoArea
    }()
    
    var adultLabel = UILabel().titleLabel(text: "", fontSize: 16)
    var titleArea = MovieTitleView()
    var overViewLabel = UILabel().titleLabel(text: "", fontSize: 12)
    
    public var movieDetailModel : MovieDetailModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
        setMovieDatas()
        
        
    }
    
    override func configure() {
        super.configure()
        
        view.addSubview(trailerView)
        view.addSubview(movieDetailArea)
        view.addSubview(adultLabel)
        view.addSubview(titleArea)
        view.addSubview(overViewLabel)
        
        trailerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.5)
        }
        movieDetailArea.snp.makeConstraints { make in
            make.top.equalTo(trailerView.snp_bottomMargin).inset(16)
            make.bottom.equalToSuperview().offset(16)
        }
        
        adultLabel.snp.makeConstraints { make in
            make.top.equalTo(movieDetailArea.snp_topMargin).offset(24)
            make.centerX.equalToSuperview()
        }
        
        titleArea.snp.makeConstraints { make in
            make.top.equalTo(adultLabel.snp_bottomMargin).offset(24)
            make.centerX.equalToSuperview()
            make.height.equalTo(movieDetailArea).multipliedBy(0.3)
            make.width.equalToSuperview()
        }
        
        overViewLabel.snp.makeConstraints { make in
            make.top.equalTo(titleArea.snp_bottomMargin).offset(16)
            make.width.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        
    }
    
    private func setMovieDatas() {
        guard let movieDetailModel = movieDetailModel else {
            return
        }

        trailerView.configureVideo(movieDetailModel.youtubeView.id.videoId)
        if let adult = movieDetailModel.adult, adult{
            adultLabel.text = Constants.adult
        } else {
            adultLabel.text = Constants.everyone
        }
        titleArea.setDatas(title: movieDetailModel.title ?? "",
                           releaseDate: movieDetailModel.relaseDate ?? "",
                           voteAverage: String(movieDetailModel.voteAverage ?? 0))
        if let overView = movieDetailModel.overview {
            overViewLabel.text = overView
        }
    }
    
}
