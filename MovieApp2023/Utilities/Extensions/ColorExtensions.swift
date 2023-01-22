//
//  ColorExtensions.swift
//  MovieApp2023
//
//  Created by Akın Aksoy on 20.01.2023.
//

import Foundation
import UIKit

extension UIColor {
    
    static var setBackgroundColor: UIColor {
        if let color = UIColor(named: "backgroundColor") {
            return color
        } else {
            return .white
        }
    }
    
    static var setBorderGreyColor: UIColor {
        if let color = UIColor(named: "borderGreyColor") {
            return color
        } else {
            return .white
        }
    }
    
    static var setbuttonColor: UIColor {
        if let color = UIColor(named: "buttonColor") {
            return color
        } else {
            return .white
        }
    }
    
    static var setButtonTextColor: UIColor {
        if let color = UIColor(named: "buttonTextColor") {
            return color
        } else {
            return .white
        }
    }
    
    static var setTextColor: UIColor {
        if let color = UIColor(named: "textColor") {
            return color
        } else {
            return .white
        }
    }
}
