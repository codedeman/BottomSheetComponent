//
//  PopupSectionModel.swift
//  BottomSheetComponent
//
//  Created by Pham Kien on 17.04.22.
//

import Foundation

public protocol PopupSectionModel:Equatable {
    
    var isSelected: Bool { get set }
    
    func search(with text: String) -> Bool
}

extension PopupSectionModel {
    // left title simple
    var leftContent: String { "" }
    
    func search(with text: String) -> Bool {
        fatalError("This abstract method and should be override by subclass")
    }
}
