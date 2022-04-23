//
//  UIVewExtension.swift
//  BottomSheetComponent
//
//  Created by Pham Kien on 23.04.22.
//

import Foundation
import UIKit


extension UIView {
    
    
    func roundTopCorner(_ radius: CGFloat) {
        if #available(iOS 11.0, *) {
            self.layer.cornerRadius = radius
            //self.clipsToBounds = true
            self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        } else {
            self.roundCorners([.topLeft, .topRight], radius: radius)
        }
    }
    
    func roundBottomCorner(_ radius: CGFloat) {
        if #available(iOS 11.0, *) {
            self.layer.cornerRadius = radius
            self.clipsToBounds = true
            self.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        } else {
            self.roundCorners([.bottomLeft, .bottomRight], radius: radius)
        }
    }
    
    func roundCorners(_ corners:UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    
}
