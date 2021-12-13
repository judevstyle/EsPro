//
//  UIColor+Extension.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 3/29/21.
//

import Foundation
import UIKit

extension UIColor {
    
    static func whiteAlpha(alpha: CGFloat) -> UIColor {
        return UIColor(white: 1, alpha: alpha)
    }

    static func blackAlpha(alpha: CGFloat) -> UIColor {
        return UIColor(white: 0, alpha: alpha)
    }
//
//    static func AppPrimary() -> UIColor {
//        return UIColor(named: "AppPrimary")!
//    }
//
//    static func AppAccent() -> UIColor {
//        return UIColor(named: "AppAccent")!
//    }
//
//    static func AppPrimaryDark() -> UIColor {
//        return UIColor(named: "AppPrimaryDark")!
//    }
//
//
//
//    static func AppPrimaryDarkGray() -> UIColor {
//        return UIColor(named: "AppPrimaryDarkGray")!
//    }
    
    static func BGLoginTop() -> UIColor {
        return UIColor(named: "BGLoginTop")!
    }
    
    static func BGLoginBottom() -> UIColor {
        return UIColor(named: "BGLoginBottom")!
    }
    
    static func NavBarTop() -> UIColor {
        return UIColor(named: "NavBarTop")!
    }
    
    static func NavBarBottom() -> UIColor {
        return UIColor(named: "NavBarBottom")!
    }
    
    static func BGTableHeaderTop() -> UIColor {
        return UIColor(named: "BGTableHeaderTop")!
    }
    
    static func BGTableHeaderBottom() -> UIColor {
        return UIColor(named: "BGTableHeaderBottom")!
    }
    
    static func IconLogin() -> UIColor {
        return UIColor(named: "IconLogin")!
    }
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    static var jetBlack = UIColor.rgb(red: 33, green: 45, blue: 79)
    static var gold = UIColor.rgb(red: 255, green: 182, blue: 0)
    static var kelly = UIColor.rgb(red: 0, green: 206, blue: 62)
    static var mediumBlue = UIColor.rgb(red: 0, green: 122, blue: 255)
    static var rosePink = UIColor.rgb(red: 255, green: 193, blue: 224)
    static var navy = UIColor.rgb(red: 66, green: 66, blue: 136)
    static var emerald = UIColor.rgb(red: 0, green: 222, blue: 182)
    static var lolipop = UIColor.rgb(red: 143, green: 20, blue: 108)
    static var ruby = UIColor.rgb(red: 235, green: 42, blue: 117)
    
    static func gradientColor(startColor: UIColor, endColor: UIColor, frame: CGRect) -> UIColor? {
        let gradient = CAGradientLayer(layer: frame.size)
        gradient.frame = frame
        gradient.colors = [startColor.cgColor, endColor.cgColor]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.2)
        gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
        UIGraphicsBeginImageContext(frame.size)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        gradient.render(in: context)
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else { return nil }
        UIGraphicsEndImageContext()
        return UIColor(patternImage: image)
    }
    
}
