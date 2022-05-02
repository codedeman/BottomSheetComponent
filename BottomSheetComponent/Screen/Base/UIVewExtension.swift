//
//  UIVewExtension.swift
//  BottomSheetComponent
//
//  Created by Pham Kien on 23.04.22.
//

import Foundation
import UIKit


extension UIView {
    
    
    func bscroundTopCorner(_ radius: CGFloat) {
        if #available(iOS 11.0, *) {
            self.layer.cornerRadius = radius
            //self.clipsToBounds = true
            self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        } else {
            self.bscroundCorners([.topLeft, .topRight], radius: radius)
        }
    }
    
    func bscroundBottomCorner(_ radius: CGFloat) {
        if #available(iOS 11.0, *) {
            self.layer.cornerRadius = radius
            self.clipsToBounds = true
            self.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        } else {
            self.bscroundCorners([.bottomLeft, .bottomRight], radius: radius)
        }
    }
    
    func bscroundCorners(_ corners:UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    
}
