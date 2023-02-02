//
//  BookingViewModel.swift
//  MovieApp2023
//
//  Created by Akın Aksoy on 2.02.2023.
//

import Foundation

class BookingViewModel {
    
    
    var viewController : BookingViewController?
    var movieModel : MovieDetailModel?
    
    init(viewController : BookingViewController,model : MovieDetailModel) {
        self.viewController = viewController
        self.movieModel = model
    }
    
    
    func bookOrCancelSeat(indexPath : IndexPath) {
        if let movieModel = movieModel,
           let movieName = movieModel.title{
            let dateFormatterGet = DateFormatter()
            dateFormatterGet.dateFormat = "yyyy-MM-dd"
            guard let date = dateFormatterGet.date(from: "2016-02-29") else {return}
            BookingManager.shared.bookOrCancelSeat(movieName: movieName, date: date, indexPath: indexPath)
        }
    }
    
    func checkSeatStatus(indexPath : IndexPath) -> Bool {
        var isSeatBooked = false
        if let movieModel = movieModel,
           let movieName = movieModel.title{
            let dateFormatterGet = DateFormatter()
            dateFormatterGet.dateFormat = "yyyy-MM-dd"
            guard let date = dateFormatterGet.date(from: "2016-02-29") else {return false}
            isSeatBooked = BookingManager.shared.checkIsBookedWithSeat(movieName: movieName, date: date, indexPath: indexPath)
        }
        return isSeatBooked
    }
    
    
    
}
