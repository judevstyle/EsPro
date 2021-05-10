//
//  UIFont+Extension.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 3/27/21.
//

import Foundation
import UIKit

extension UIFont {
    
    static func PrimaryBold(size: CGFloat) -> UIFont {
        return UIFont(name: "RobotoCondensed-Bold", size: size)!
    }

    static func Primary(size: CGFloat) -> UIFont {
        return UIFont(name: "supermarket", size: size)!
    }

    static func PrimaryRegular(size: CGFloat) -> UIFont {
        return UIFont(name: "RobotoCondensed-Regular", size: size)!
    }

    static func PrimaryLight(size: CGFloat) -> UIFont {
        return UIFont(name: "RobotoCondensed-Light", size: size)!
    }
    
}
