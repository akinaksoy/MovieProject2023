//
//  ViewController.swift
//  MovieApp2023
//
//  Created by Akın Aksoy on 20.01.2023.
//

import UIKit

protocol DiscoverViewControllerDataSource {
    func setMovieTitle(_ index : Int)
    func didTapMovieBanner(_ index : Int)
}


class DiscoverViewController: BaseViewController {

    
    fileprivate var headerView = DiscoverHeaderView()
    fileprivate var movieTitleView = MovieTitleView()
    var viewModel : DiscoverViewModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = DiscoverViewModel(viewController: self)
        viewModel?.fetchNowPlayingMovieList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        configure()
        headerView.discoverDelegate = self
    }
    
    override func configure() {
        super.configure()
       
        view.addSubview(headerView)
        view.addSubview(movieTitleView)
        headerView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaInsets)
            make.leading.trailing.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.6)
        }
        movieTitleView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp_bottomMargin).offset(88)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.trailing.leading.equalToSuperview()
        }
   
    }
    
    internal func updateImages(_ images : [String]) {
        headerView.setImages(images)
    }
}

extension DiscoverViewController : DiscoverViewControllerDataSource {
    func didTapMovieBanner(_ index: Int) {
        viewModel?.fetchYoutubeTrailer(index: index)
    }
    
    func setMovieTitle(_ index: Int) {
        movieTitleView.configure(index: index)
    }
    
}

extension DiscoverViewController : NavigateToMovieDetailRouterLogic {
    
    internal func navigateToMovieDetail(movieDetail : MovieDetailModel) {
        let movieDetailVC = MovieDetailViewController()
        movieDetailVC.movieDetailModel = movieDetail
        navigationController?.pushViewController(movieDetailVC, animated: true)
    }
}
