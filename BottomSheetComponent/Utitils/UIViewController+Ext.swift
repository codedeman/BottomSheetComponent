//
//  UIViewController+Ext.swift
//  BottomSheetComponent
//
//  Created by Kevin on 12/19/22.
//

import UIKit

extension  UIViewController {
    
    public var bsSheetViewController: BSSheetViewController? {
        var parent = self.parent
        while let currentParent = parent {
            if let sheetViewController = currentParent as? SheetViewController {
                return self.bsSheetViewController
            } else {
                parent = currentParent.parent
            }
        }
        return nil
    }
}

