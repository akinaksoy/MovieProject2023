//
//  DiscoverMovieView.swift
//  MovieApp2023
//
//  Created by Akın Aksoy on 21.01.2023.
//


import UIKit

@objc public protocol MovieBannerCollectionViewDataSource {
    var numberOfItems: Int { get }
    
    func movieBannerCollectionView(_ movieBannerCollectionView: MovieBannerCollectionView,
                                cellForItemAt index: Int,
                                helperIndexPath: IndexPath) -> UICollectionViewCell
    
    @objc optional func movieBannerCollectionView(_ movieBannerCollectionView: MovieBannerCollectionView,
                                               didSelectItemAt index: Int)
    @objc optional func movieBannerCollectionView(_ movieBannerCollectionView: MovieBannerCollectionView,
                                               didDisplayItemAt index: Int)
}

public class MovieBannerCollectionView: UICollectionView {
    public weak var movieBannerDataSource: MovieBannerCollectionViewDataSource?

    public let flowLayout: UICollectionViewFlowLayout
    public var autoScrollTimer: TimeInterval = 5.0

    public var isAutoScrollEnabled: Bool = false {
        didSet {
            if isAutoScrollEnabled {
                startScrollTimer()
            } else {
                stopScrollTimer()
            }
        }
    }
    
    public var currentPageIndex: Int {
        get {
            let centerPage = CGPoint(x: contentOffset.x + (frame.width / 2), y: (frame.height / 2))
            if let helperIndexPath = indexPathForItem(at: centerPage) {
                return getRealPageIndex(helperIndexPath)
            } else {
                return 0
            }
        }
        set {
            setHelperPage(newValue + 1)
            checkDisplayPage(newValue)
        }
    }

    public var helperCurrentPageIndex: Int {
        get {
            return Int(ceil(contentOffset.x / flowLayout.itemSize.width))
        }
        set {
            setHelperPage(newValue, animated: false)
        }
    }

    private var isFirstPageInit = false
    private var scrollTimer: Timer?

    private var numberOfItems: Int {
        return movieBannerDataSource?.numberOfItems ?? 0
    }

    private var helperCountOfItems: Int {
        if let realNumberOfItems = movieBannerDataSource?.numberOfItems,
            realNumberOfItems > 0 {
            return realNumberOfItems + 2
        } else {
            return 0
        }
    }

    public init(frame: CGRect, collectionViewFlowLayout layout: UICollectionViewFlowLayout) {
        flowLayout = layout
        super.init(frame: frame, collectionViewLayout: layout)
        delegate = self
        dataSource = self
        isPagingEnabled = true
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
    }

    required init?(coder aDecoder: NSCoder) {
        flowLayout = UICollectionViewFlowLayout()
        super.init(coder: aDecoder)
        self.collectionViewLayout = flowLayout
        self.delegate = self
        self.dataSource = self
        isPagingEnabled = true
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
    }

    private func getRealPageIndex(_ helperIndexPath: IndexPath) -> Int {
        guard let realNumberOfItems = movieBannerDataSource?.numberOfItems else {
            return 0
        }

        if helperIndexPath.row == realNumberOfItems + 1 {
            return 0
        }

        if helperIndexPath.row == 0 {
            return realNumberOfItems - 1
        }

        return helperIndexPath.row - 1
    }

    private func setHelperPage(_ helperPageNumber: Int, animated: Bool = false) {
        precondition((0..<helperCountOfItems).contains(helperPageNumber))
        let newContentOffset = CGPoint(x: flowLayout.itemSize.width * CGFloat(helperPageNumber), y: 0)
        setContentOffset(newContentOffset, animated: animated)
    }

    /// Sets current displayed page.
    /// Permissible values are from `0` to numberOfItems returned in `movieBannerDataSource`.
    public func setCurrentPage(_ pageNumber: Int, animated: Bool = false) {
        precondition((0..<numberOfItems).contains(pageNumber))
        setHelperPage(pageNumber + 1, animated: animated)
    }

    private func bannerItems(_ scrollView: UIScrollView) {
        let page = helperCurrentPageIndex
        if (page == 0) {
            setHelperPage(helperCountOfItems - 2)
        } else if (page == helperCountOfItems) {
            setHelperPage(1)
        }
    }

    private func checkDisplayPage(_ index: Int) {
        movieBannerDataSource?.movieBannerCollectionView?(self, didDisplayItemAt: index)
    }

    // MARK: - Autoscrolling

    private func startScrollTimer() {
        if isAutoScrollEnabled {
            scrollTimer?.invalidate()
            scrollTimer = nil
            scrollTimer = Timer.scheduledTimer(withTimeInterval: autoScrollTimer,
                                                       repeats: false) { [weak self] _ in self?.scrollToNextElement() }
        }

        
    }

    private func stopScrollTimer() {
        scrollTimer?.invalidate()
        scrollTimer = nil
    }

    @objc private func scrollToNextElement() {
        guard helperCountOfItems > 0 else { return }
        if helperCurrentPageIndex == helperCountOfItems - 1 {
            setHelperPage(1)
            let newPageRealIndex = helperCurrentPageIndex < (numberOfItems) ? helperCurrentPageIndex : 0
            setHelperPage(helperCurrentPageIndex + 1, animated: true)
            startScrollTimer()
            checkDisplayPage(newPageRealIndex)
            return
        } else {
            let newPageRealIndex = helperCurrentPageIndex < (numberOfItems) ? helperCurrentPageIndex : 0
            setHelperPage(helperCurrentPageIndex + 1, animated: true)
            startScrollTimer()
            checkDisplayPage(newPageRealIndex)
        }
    }
}

extension MovieBannerCollectionView: UIScrollViewDelegate {
    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        bannerItems(scrollView)
        checkDisplayPage(currentPageIndex)
    }

    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        bannerItems(scrollView)
        startScrollTimer()
    }
    
    public func scrollViewWillEndDragging(_ scrollView: UIScrollView,
                                          withVelocity velocity: CGPoint,
                                          targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        checkDisplayPage(currentPageIndex)
    }
}

extension MovieBannerCollectionView: UICollectionViewDelegate {
    public func collectionView(_ collectionView: UICollectionView,
                               didSelectItemAt indexPath: IndexPath) {
        
        let realIndex = getRealPageIndex(indexPath)
        movieBannerDataSource?.movieBannerCollectionView?(self,
                                                    didSelectItemAt: realIndex)
    }
}

extension MovieBannerCollectionView: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView,
                               numberOfItemsInSection section: Int) -> Int {
        
        if helperCountOfItems > 0 && !isFirstPageInit {
            currentPageIndex = 0
            isFirstPageInit = true
        }
        return helperCountOfItems
    }

    public func collectionView(_ collectionView: UICollectionView,
                               cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let movieBannerDataSource = movieBannerDataSource else {
            return UICollectionViewCell()
        }

        let index = getRealPageIndex(indexPath)
        return movieBannerDataSource.movieBannerCollectionView(self,
                                                         cellForItemAt: index,
                                                         helperIndexPath: indexPath)
    }
}
