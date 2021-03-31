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
        return UIFont(name: "Kanit-Bold", size: size)!
    }

    static func PrimaryMedium(size: CGFloat) -> UIFont {
        return UIFont(name: "Kanit-Medium", size: size)!
    }

    static func PrimaryRegular(size: CGFloat) -> UIFont {
        return UIFont(name: "Kanit-Regular", size: size)!
    }

    static func PrimaryLight(size: CGFloat) -> UIFont {
        return UIFont(name: "Kanit-Light", size: size)!
    }
    
}
