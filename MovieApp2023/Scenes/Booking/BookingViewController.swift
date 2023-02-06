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
        layout.itemSize = CGSize(width: 36, height: 36)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .setBackgroundColor
        collectionView.register(BookingSeatsCollectionViewCell.self,forCellWithReuseIdentifier: BookingSeatsCollectionViewCell.cellIdentifier)
       return collectionView
    }()
    
    let selectedView = SeatStatusView()
    let availableView = SeatStatusView()
    let reservedView = SeatStatusView()
    
    let seatHorizantalView = UIStackView().horizontalStackView()
    
    let bookingCartView = BookingItemsUIView()
    var movie : MovieDetailModel?
    var viewModel : BookingViewModel?
    var date : Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewModel()
        configure()
        configureSeatViews()
    }
    
    func setViewModel() {
        if let movie = movie {
            viewModel = BookingViewModel(viewController: self, model: movie)
        }
    }
    
    override func configure() {
        super.configure()
        
        view.addSubview(movieScreen)
        view.addSubview(movieTheaterCollectionView)
        seatHorizantalView.addArrangedSubview(selectedView)
        seatHorizantalView.addArrangedSubview(availableView)
        seatHorizantalView.addArrangedSubview(reservedView)
        view.addSubview(seatHorizantalView)
        view.addSubview(bookingCartView)
        
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
            make.height.equalToSuperview().multipliedBy(0.4)
        }
        selectedView.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(6)
            make.height.equalTo(16)
        }
        availableView.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(6)
            make.height.equalTo(16)
        }
        reservedView.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(6)
            make.height.equalTo(16)
        }
        seatHorizantalView.snp.makeConstraints { make in
            make.top.equalTo(movieTheaterCollectionView.snp_bottomMargin).offset(24)
            make.width.equalToSuperview().multipliedBy(0.6)
            make.centerX.equalToSuperview()
            make.height.equalTo(16)
        }
        bookingCartView.snp.makeConstraints { make in
            make.top.equalTo(seatHorizantalView.snp_bottomMargin).offset(8)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.width.equalToSuperview()
        }
    }
    
    private func configureSeatViews() {
        selectedView.configure(chairStatus: .selectedChair)
        availableView.configure(chairStatus: .availableChair)
        reservedView.configure(chairStatus: .reservedChair)
    }
    
}

extension BookingViewController : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? BookingSeatsCollectionViewCell {
            collectionView.reloadInputViews()
            
            viewModel?.bookOrCancelSeat(indexPath: indexPath)
            
            let isChairSelected = viewModel?.checkSeatStatus(indexPath: indexPath) ?? false
            cell.didTapSeat(isChairSelected: isChairSelected )
        }
    }
    
    
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
