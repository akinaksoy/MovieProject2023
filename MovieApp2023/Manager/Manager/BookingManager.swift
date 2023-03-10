//
//  BookingManager.swift
//  MovieApp2023
//
//  Created by Akın Aksoy on 2.02.2023.
//

import Foundation
import Kingfisher
import UIKit
struct BookingManager {
    static var shared = BookingManager()
    
    var bookingList = [BookingSeatModel]()
    
    
    mutating func bookOrCancelSeat(movieName : String,date : Date,indexPath : IndexPath,posterPath : String) {
        
        let isElementExist = checkIsBooked(movieName: movieName, date: date, indexPath: indexPath)
        
        if isElementExist {
            let bookingModel = bookingList.filter({$0.title == movieName &&
                                                    $0.date == date &&
                (($0.selectedChairs?.contains(indexPath)) != nil)}).first
            
            let selectedBookingItemIndex = bookingList.firstIndex(where: {$0.title == movieName && $0.date == date})
            
            if var bookingSelectedChair = bookingModel?.selectedChairs,let indexOfBooking = selectedBookingItemIndex  {
                if let index = bookingSelectedChair.firstIndex(of: indexPath){
                    bookingSelectedChair.remove(at: index)
                    if bookingSelectedChair.count < 1 {
                        bookingList.remove(at: indexOfBooking)
                    }else {
                        bookingList[indexOfBooking].selectedChairs = bookingSelectedChair
                        bookingList[indexOfBooking].price = bookingSelectedChair.count*20
                    }
                } else {
                    bookingList[indexOfBooking].selectedChairs?.append(indexPath)
                    
                }
            }
        }
        else {
            let selectedChairs = [indexPath]
            let bookingModel = BookingSeatModel(title: movieName, date: date, selectedChairs: selectedChairs, price: 0,poster: posterPath)
            self.bookingList.append(bookingModel)
        }
        calculatePrices()
    }
    
    mutating func calculatePrices() {
        for (index,bookingItem) in bookingList.enumerated() {
            guard let selectedItems = bookingItem.selectedChairs else {return}
            let selectedChairPrice = selectedItems.count*20
            bookingList[index].price = selectedChairPrice
        }
    }
    
    
    func checkIsBooked(movieName : String,date : Date,indexPath : IndexPath) -> Bool {
        
        let selectedBookingItem = bookingList.filter({$0.title == movieName &&
                                                       $0.date == date})
        var isElementExist = false
        
        if selectedBookingItem.count > 0
        {isElementExist = true}
        
        return isElementExist
    }
    
    func checkIsBookedWithSeat(movieName : String,date : Date,indexPath : IndexPath) -> Bool {
        
        let selectedBookingItem = bookingList.filter({$0.title == movieName &&
                                                       $0.date == date &&
            $0.selectedChairs?.firstIndex(of: indexPath) != nil
        })
        
        var isElementExist = false
        
        if selectedBookingItem.count > 0
        {isElementExist = true}
        
        return isElementExist
    }
    
    func configureSeatTexts(indexPath : [IndexPath])-> String{
        var seatTexts = ""
        for indexPath in indexPath {
            seatTexts += indexPath.toSeatString()
        }
        return seatTexts
    }
    
}
