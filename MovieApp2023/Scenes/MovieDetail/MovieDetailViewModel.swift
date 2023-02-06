//
//  MovieDetailViewModel.swift
//  MovieApp2023
//
//  Created by Akın Aksoy on 23.01.2023.
//

import Foundation

struct MovieDetailViewModel{
    
    var viewController : MovieDetailViewController?
    
    var dateStringArray = [String]()
    var dateArray = [Date]()
    var year = 2023
    var dateHours = [String]()
    var selectedDateString : String?
    var selectedHourString : String?
    
    init(viewController : MovieDetailViewController) {
        self.viewController = viewController
    }
    
    mutating func setDateModels() {
        setCurrentWeekDays()
        setDateHours()
    }
    
    func configureDateBooking() -> Date? {
        guard let selectedDateString = selectedDateString,let selectedHourString = selectedHourString else {
            return nil
        }

        let dateString = "\(selectedDateString) \(selectedHourString)"
        return dateString.toDate(withDate: dateString)
    }
    
    mutating func setCurrentWeekDays() {
        var calendar = Calendar.autoupdatingCurrent
        calendar.firstWeekday = 7
        let today = calendar.startOfDay(for: Date())
        var week = [String]()
        if let weekInterval = calendar.dateInterval(of: .weekOfYear, for: today) {
            for i in 0...6 {
                if let day = calendar.date(byAdding: .day, value: i, to: weekInterval.start) {
                    let date = Calendar.current.dateComponents([.day, .year, .month], from: day)
                    let dateString = "\(checkDateIfOneDecimal(weekDay: date.day))-\(checkDateIfOneDecimal(weekDay: date.month))"
                    year = date.year ?? 2023
                    dateArray += [day]
                    week.append(dateString)
                }
            }
        }
        dateStringArray = week
    }
    
    mutating func setDateHours() {
        dateHours = ["10:00","14:00","18:00","22:00"]
    }
    
    func checkDateIfOneDecimal(weekDay : Int?) -> String{
        
        if let weekDay = weekDay, weekDay < 10 {
            return "0\(weekDay)"
        } else {
            return "\(weekDay ?? 10)"
        }
    }
    
    
}
