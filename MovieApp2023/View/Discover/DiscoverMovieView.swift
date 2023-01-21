//
//  DiscoverMovieView.swift
//  MovieApp2023
//
//  Created by Huawei PC on 20.01.2023.
//

import UIKit
import SnapKit
class DiscoverMovieView: UIView {

    
    var bannerMovieList = [String]()
    
    let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = .white
        pageControl.pageIndicatorTintColor = .setbuttonColor
        return pageControl
    }()
    
    lazy var collectionView : MovieBannerCollectionView = {
        let layout : UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        let collectionView = MovieBannerCollectionView(frame: .zero, collectionViewFlowLayout: UICollectionViewFlowLayout())
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.movieBannerDataSource = self
        collectionView.autoScrollTimer = 5.0
        collectionView.isAutoScrollEnabled = true
        collectionView.backgroundColor = .clear
        collectionView.flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width - 60, height: 300)
        collectionView.register(DiscoverMovieCollectionView.self,forCellWithReuseIdentifier: DiscoverMovieCollectionView.cellIdentifier)
        return collectionView
    }()

    fileprivate var bannerHeight = 0
    fileprivate var bannerWidth = 0
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        self.addSubview(collectionView)
        self.addSubview(pageControl)
        
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        pageControl.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-16)
            make.centerX.equalTo(collectionView.snp.centerX)
        }
        
        pageControl.sizeToFit()
        pageControl.subviews.forEach {
            $0.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setBannerImages(_ images: [String]) {
        self.bannerMovieList = images
        collectionView.reloadData()
        pageControl.numberOfPages = bannerMovieList.count
    }
    
}



extension DiscoverMovieView: MovieBannerCollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var numberOfItems: Int {
        return bannerMovieList.count
    }
    
    func movieBannerCollectionView(_ movieBannerCollectionView: MovieBannerCollectionView, cellForItemAt index: Int, helperIndexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DiscoverMovieCollectionView.cellIdentifier, for: helperIndexPath) as! DiscoverMovieCollectionView
        cell.setImage(bannerMovieList[index])
        return cell
    }
    
    
    func movieBannerCollectionView(_ movieBannerCollectionView: MovieBannerCollectionView, didDisplayItemAt index: Int) {
        pageControl.currentPage = index
    }
    
}
