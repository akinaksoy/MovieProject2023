//
//  IndexPath+Extension.swift
//  MovieApp2023
//
//  Created by Akın Aksoy on 17.02.2023.
//

import Foundation

extension IndexPath{
    
    func toSeatString() -> String{
        var seat = ""
        switch self.section {
        case 0 :
            seat = "A"
        case 1 :
            seat = "B"
        case 2 :
            seat = "C"
        case 3 :
            seat = "D"
        case 4 :
            seat = "E"
        case 5 :
            seat = "F"
        case 6 :
            seat = "G"
        case 7 :
            seat = "H"
        default:
            seat = ""
        }
        return "\(seat)\(self.row),"
    }
}
