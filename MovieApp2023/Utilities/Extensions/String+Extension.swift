//
//  String+Extension.swift
//  MovieApp2023
//
//  Created by Akın Aksoy on 6.02.2023.
//

import Foundation

extension String {
    func toDate(withDate dateString: String)-> Date?{

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        dateFormatter.timeZone = TimeZone.current
        let date = dateFormatter.date(from: dateString)
        return date

    }
}
