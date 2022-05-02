//
//  UIView+Extension.swift
//  BottomSheetExample
//
//  Created by Pham Kien on 01.05.22.
//

import Foundation
import UIKit


extension UIView {
    public static func createFromXIB () -> Self {
        let nibName = String(describing: self)
        let view = Bundle.main.loadNibNamed(nibName, owner: nil, options: nil)?.first
        return view as! Self
    }
}
