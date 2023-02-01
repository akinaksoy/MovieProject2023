//
//  BookingViewController.swift
//  MovieApp2023
//
//  Created by Akın Aksoy on 1.02.2023.
//

import UIKit

class BookingViewController: BaseViewController {

    
    
    private let movieScreen : UIImageView = {
       let screenImage = UIImageView()
        screenImage.contentMode = .scaleToFill
        screenImage.backgroundColor = .black
        screenImage.image = UIImage(named: "screen" )
        return screenImage
    }()
    
    private lazy var movieTheaterCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 40, height: 40)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .setBackgroundColor
        collectionView.register(BookingSeatsCollectionViewCell.self,forCellWithReuseIdentifier: BookingSeatsCollectionViewCell.cellIdentifier)
       return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
    
    override func configure() {
        super.configure()
        
        view.addSubview(movieScreen)
        view.addSubview(movieTheaterCollectionView)
        movieScreen.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.trailing.leading.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.3)
            make.width.equalToSuperview()
        }
        movieTheaterCollectionView.snp.makeConstraints { make in
            make.top.equalTo(movieScreen.snp_bottomMargin).offset(8)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().inset(16)
            make.height.equalToSuperview().multipliedBy(0.5)
        }
    }
    
}

extension BookingViewController : UICollectionViewDelegate {
    
}

extension BookingViewController : UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BookingSeatsCollectionViewCell.cellIdentifier , for: indexPath) as! BookingSeatsCollectionViewCell
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
            return 4
    }
    
    func collectionView(collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 24
    }
}
