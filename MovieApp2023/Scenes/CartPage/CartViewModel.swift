//
//  CartViewModel.swift
//  MovieApp2023
//
//  Created by Akın Aksoy on 17.02.2023.
//

import Foundation

class CartViewModel {
    
    var bookingList : [BookingSeatModel]? {
        didSet {
            BookingManager.shared.bookingList = bookingList ?? []
        }
    }
    
    func fetchBookingList() {
        bookingList = BookingManager.shared.bookingList
    }
    
    func calculateTotalPrice() -> Int{
        var price = 0
        if let bookingList = bookingList {
            for bookingItem in bookingList {
                price += bookingItem.price ?? 0
            }
        }
        return price
    }
    
}
