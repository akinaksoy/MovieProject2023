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
    
    var adultLabel = UILabel().setLabel(text: "", fontSize: 16, fontColor: .setTextColor)
    var titleArea = MovieTitleView()
    var overViewLabel = UILabel().setLabel(text: "", fontSize: 12, fontColor: .setTextColor)
    
    lazy var bookingButton : ButtonView = {
        let button = ButtonView()
        button.configure(buttonText: Constants.booking,icon: "cart.circle",type: .functionalButton)
        button.didTapButton = {
            self.didTappedBookingButton()
        }
        return button
    }()
    
    lazy var dateButton : ButtonView = {
        let button = ButtonView()
        button.configure(buttonText: "5-10-2022",icon: "calendar.circle.fill",type: .filterButton)
        button.didTapButton = {
            self.didTappedDateButton()
        }
        return button
    }()
    
    lazy var dateHourButton : ButtonView = {
        let button = ButtonView()
        button.configure(buttonText: "22:00",icon: "stopwatch",type: .filterButton)
        button.didTapButton = {
            self.didTappedDateHourButton()
        }
        return button
    }()
    
    let filterButtonStackView = UIStackView().horizontalStackView()
    
    public var movieDetailModel : MovieDetailModel?
    lazy var viewModel = MovieDetailViewModel(viewController: self)
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
        setMovieDatas()
        viewModel.setDateModels()
    }
    
    override func configure() {
        super.configure()
        view.addSubview(trailerView)
        view.addSubview(movieDetailArea)
        view.addSubview(adultLabel)
        view.addSubview(titleArea)
        view.addSubview(overViewLabel)
        filterButtonStackView.addArrangedSubview(dateButton)
        filterButtonStackView.addArrangedSubview(dateHourButton)
        view.addSubview(filterButtonStackView)
        view.addSubview(bookingButton)
        
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
            make.height.equalTo(movieDetailArea).multipliedBy(0.2)
            make.width.equalToSuperview()
        }
        
        overViewLabel.snp.makeConstraints { make in
            make.top.equalTo(titleArea.snp_bottomMargin).offset(8)
            make.width.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        dateButton.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.5)
        }
        dateHourButton.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.5)
        }
        filterButtonStackView.snp.makeConstraints { make in
            make.top.equalTo(overViewLabel.snp_bottomMargin).offset(8)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.7)
            make.height.equalTo(40)
        }
        
        bookingButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.3)
            make.height.equalTo(40)
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
    
    private func didTappedBookingButton() {
        navigateToBookingPage()
    }
    
    private func didTappedDateButton() {
        let dateView = SelectDateView()
        view.addSubview(dateView)
        dateView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        dateView.configure()
        dateView.setDatas(dateArray: viewModel.dateStringArray, viewType: .dateView)
        
    }
    
    private func didTappedDateHourButton() {
        let dateView = SelectDateView()
        view.addSubview(dateView)
        dateView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        dateView.configure()
        dateView.setDatas(dateArray: viewModel.dateHours, viewType: .hourView)
        
    }
    
}

extension MovieDetailViewController : NavigateToBookingPageRouterLogic {
    func navigateToBookingPage() {
        let bookingVC = BookingViewController()
        bookingVC.movie = movieDetailModel
        navigationController?.pushViewController(bookingVC, animated: true)
    }
}
