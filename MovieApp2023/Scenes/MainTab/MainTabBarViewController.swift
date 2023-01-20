//
//  MainTabBarViewController.swift
//  MovieApp2023
//
//  Created by Akın Aksoy on 20.01.2023.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .setBackgroundColor
        
        let discoverVC = UINavigationController(rootViewController: DiscoverViewController())
        let searchVC = UINavigationController(rootViewController: DiscoverViewController())
        let cartVC = UINavigationController(rootViewController: DiscoverViewController())
        let profileVC = UINavigationController(rootViewController: DiscoverViewController())
        
        discoverVC.tabBarItem.image = UIImage(systemName: "play.tv")
        searchVC.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        cartVC.tabBarItem.image = UIImage(systemName: "ticket")
        profileVC.tabBarItem.image = UIImage(systemName: "person")
        tabBar.tintColor = .setbuttonColor
        tabBar.unselectedItemTintColor = .label
       
        setViewControllers([discoverVC,searchVC,cartVC,profileVC], animated: true)
        
    }
    

}
