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
    var selectedSeatIndexes = [IndexPath]()
    init(viewController : BookingViewController,model : MovieDetailModel) {
        self.viewController = viewController
        self.movieModel = model
    }
    
    
    func selectSeatIndexes(indexPath : IndexPath) {
        if selectedSeatIndexes.contains(where: {$0 == indexPath}) {
            if let index = selectedSeatIndexes.firstIndex(of: indexPath) {
                selectedSeatIndexes.remove(at: index)
            }
        } else {
            selectedSeatIndexes.append(indexPath)
        }
    }
    
    func bookOrCancelSeat() {
        for indexPath in selectedSeatIndexes {
            if let movieModel = movieModel,
               let movieName = movieModel.title{
                let dateFormatterGet = DateFormatter()
                dateFormatterGet.dateFormat = "yyyy-MM-dd"
                guard let date = dateFormatterGet.date(from: "2016-02-29") else {return}
                BookingManager.shared.bookOrCancelSeat(movieName: movieName, date: date, indexPath: indexPath,posterPath: movieModel.poster ?? "")
            }
        }
    }
    
    func checkSeatStatus(indexPath : IndexPath) -> Bool {
        var isSeatBooked = false
        if let movieModel = movieModel,
           let movieName = movieModel.title{
            let dateFormatterGet = DateFormatter()
            dateFormatterGet.dateFormat = "yyyy-MM-dd"
            guard let date = dateFormatterGet.date(from: "2016-02-29") else {return false}
            isSeatBooked = checkIsBookedWithSeat(indexPath: indexPath)
        }
        return isSeatBooked
    }
    
    func checkIsBookedWithSeat(indexPath : IndexPath) -> Bool {
        if selectedSeatIndexes.contains(where: {$0 == indexPath}) {
            return true
        } else {
            return false
        }
    }
    
    
}
