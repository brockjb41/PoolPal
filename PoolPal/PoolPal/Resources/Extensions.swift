//
//  Colors.swift
//  PoolPal
//
//  Created by Brock Boyington on 6/4/18.
//  Copyright © 2018 Brock Boyington. All rights reserved.
//

import UIKit

extension UIColor {
    
    static func mainRed() -> UIColor {
        return UIColor(red: 158.0/255.0, green: 27.0/255.0, blue: 50.0/255.0, alpha: 1.0)
    }
    static func mainGray() -> UIColor {
        return UIColor(red: 130.0/255.0, green:138.0/255.0, blue: 143.0/255.0, alpha: 1.0)
    }
    static func mainScheme3() -> UIColor {
        return UIColor(red: 87.0/255.0, green: 173.0/255.0, blue: 104.0/255.0, alpha: 1.0)
    }
    static func mainWhite() -> UIColor {
        return UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)
    }
    static func redComplement1() -> UIColor {
        return UIColor(red: 202.0/255.0, green: 34.0/255.0, blue: 64.0/255.0, alpha: 1.0)
    }
    static func mainOffWhite() -> UIColor {
        return UIColor(red: 249.0/255.0, green: 249.0/255.0, blue: 249.0/255.0, alpha: 1.0)
    }
    
    
    
}

extension UIView {
    func anchor(top: NSLayoutYAxisAnchor?,
                left: NSLayoutXAxisAnchor?,
                bottom: NSLayoutYAxisAnchor?,
                right: NSLayoutXAxisAnchor?,
                paddingTop: CGFloat,
                paddingLeft: CGFloat,
                paddingBottom: CGFloat,
                paddingRight: CGFloat,
                width: CGFloat,
                height: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: paddingBottom).isActive = true
        }
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}
