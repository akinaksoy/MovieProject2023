//
//  ViewController.swift
//  MovieApp2023
//
//  Created by Akın Aksoy on 20.01.2023.
//

import UIKit

class DiscoverViewController: UIViewController {

    
    fileprivate let headerView = DiscoverHeaderView()
    var viewModel : DiscoverViewModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = DiscoverViewModel(viewController: self)
        viewModel?.fetchNowPlayingMovieList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        configure()
    }
    
    private func configure() {
        view.backgroundColor = .setBackgroundColor
        view.addSubview(headerView)
        
        headerView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(32)
            make.leading.trailing.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.6)
        }
    }
    
    internal func reloadData() {
        print(viewModel?.upcomingMovies)
    }

}

