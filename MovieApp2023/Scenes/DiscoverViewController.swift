//
//  ViewController.swift
//  MovieApp2023
//
//  Created by Akın Aksoy on 20.01.2023.
//

import UIKit

class DiscoverViewController: UIViewController {

    
    fileprivate let headerView = DiscoverHeaderView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        
    }
    
    private func configure() {
        view.addSubview(headerView)
        
        headerView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(32)
            make.leading.trailing.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.6)
        }
    }


}

