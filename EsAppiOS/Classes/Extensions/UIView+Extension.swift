//
//  UIView+Extension.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 3/27/21.
//

import UIKit

extension UIView {
    
    func setRounded(rounded: CGFloat) {
        self.layer.cornerRadius = rounded
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
         let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
         let mask = CAShapeLayer()
         mask.path = path.cgPath
         layer.mask = mask
     }
    
    enum ViewSide {
        case Left, Right, Top, Bottom
    }

    func addBorder(toSide side: ViewSide, withColor color: CGColor, andThickness thickness: CGFloat) {

        let border = CALayer()
        border.backgroundColor = color

        switch side {
        case .Left: border.frame = CGRect(x: frame.minX, y: frame.minY, width: thickness, height: frame.height); break
        case .Right: border.frame = CGRect(x: frame.maxX, y: frame.minY, width: thickness, height: frame.height); break
        case .Top: border.frame = CGRect(x: frame.minX, y: frame.minY, width: frame.width, height: thickness); break
        case .Bottom: border.frame = CGRect(x: frame.minX, y: frame.maxY, width: frame.width, height: thickness); break
        }

        layer.addSublayer(border)
    }
    
    func useUnderline() -> Void {
      let border = CALayer()
      let borderWidth = CGFloat(0.5) // Border Width
      border.borderColor = UIColor.gray.cgColor
      border.frame = CGRect(origin: CGPoint(x: 0,y :self.frame.size.height - borderWidth), size: CGSize(width: self.frame.size.width, height: self.frame.size.height))
      border.borderWidth = borderWidth
      self.layer.addSublayer(border)
      self.layer.masksToBounds = true
    }
    
    func useRightline() -> Void {
      let border = CALayer()
      let borderWidth = CGFloat(0.5) // Border Width
      border.borderColor = UIColor.gray.cgColor
      border.frame = CGRect(origin: CGPoint(x: 0,y :self.frame.size.height - borderWidth), size: CGSize(width: self.frame.size.width, height: self.frame.size.height))
      border.borderWidth = borderWidth
      self.layer.addSublayer(border)
      self.layer.masksToBounds = true
    }
    
    func addTopBorder(with color: UIColor?, andWidth borderWidth: CGFloat) {
        let border = UIView()
        border.backgroundColor = color
        border.autoresizingMask = [.flexibleWidth, .flexibleBottomMargin]
        border.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: borderWidth)
        addSubview(border)
    }

    func addBottomBorder(with color: UIColor?, andWidth borderWidth: CGFloat) {
        let border = UIView()
        border.backgroundColor = color
        border.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
        border.frame = CGRect(x: 0, y: frame.size.height - borderWidth, width: frame.size.width, height: borderWidth)
        addSubview(border)
    }

    func addLeftBorder(with color: UIColor?, andWidth borderWidth: CGFloat) {
        let border = UIView()
        border.backgroundColor = color
        border.frame = CGRect(x: 0, y: 0, width: borderWidth, height: frame.size.height)
        border.autoresizingMask = [.flexibleHeight, .flexibleRightMargin]
        addSubview(border)
    }

    func addRightBorder(with color: UIColor?, andWidth borderWidth: CGFloat) {
        let border = UIView()
        border.backgroundColor = color
        border.autoresizingMask = [.flexibleHeight, .flexibleLeftMargin]
        border.frame = CGRect(x: frame.size.width - borderWidth, y: 0, width: borderWidth, height: frame.size.height)
        addSubview(border)
    }
    
    
    enum Direction: Int {
          case topToBottom = 0
          case bottomToTop
          case leftToRight
          case rightToLeft
      }
      
    func applyGradient(colors: [Any]?, locations: [NSNumber]? = [0.0, 1.0], direction: Direction = .topToBottom, cornerRadius: CGFloat) {
          
          let gradientLayer = CAGradientLayer()
          gradientLayer.frame = self.bounds
          gradientLayer.colors = colors
          gradientLayer.locations = locations
          gradientLayer.cornerRadius = cornerRadius
          
          switch direction {
          case .topToBottom:
              gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
              gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
              
          case .bottomToTop:
              gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
              gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
              
          case .leftToRight:
              gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
              gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
              
          case .rightToLeft:
              gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.5)
              gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.5)
          }
          
          self.layer.addSublayer(gradientLayer)
      }
    
    
    func constrainHeight(constant: CGFloat) {
        constraints.forEach {
           if $0.firstAttribute == .height {
                self.removeConstraint($0)
           }
        }

        heightAnchor.constraint(equalToConstant: constant).isActive = true
        superview!.layoutIfNeeded()
    }
}
