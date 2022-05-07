//
//  BSSize.swift
//  BottomSheetComponent
//
//  Created by Kevin on 12/19/22.
//

import Foundation

public enum BSSize: Equatable {
    case intrinsic
    case fixed(CGFloat)
    case fullscreen
    case percent(Float)
    case marginFromTop(CGFloat)
}
