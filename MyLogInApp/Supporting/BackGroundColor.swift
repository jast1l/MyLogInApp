//
//  BackGroundColor.swift
//  MyLogInApp
//
//  Created by MACBOOK on 04.04.2021.
//

import UIKit

extension UIView {
    
    var topColor: UIColor {
        UIColor(red: 240/255,
                green: 150/255,
                blue: 100/255,
                alpha: 1)
    }
    
    var bottomColor: UIColor {
        UIColor(red: 180/255,
                green: 200/255,
                blue: 150/255,
                alpha: 1)
    }
    
    func addVerticalGradientLayer() {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        layer.insertSublayer(gradient, at: 0)
    }
}
