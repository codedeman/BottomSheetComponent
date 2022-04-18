//
//  UserModel.swift
//  BottomSheetExample
//
//  Created by Pham Kien on 18.04.22.
//

import Foundation
import BottomSheetComponent

class UserModel:PopupSectionModel {
    var isSelected: Bool = false
    var accountName:String?
    var typeAccount:String?
    static func == (lhs: UserModel, rhs: UserModel) -> Bool {
        return lhs.accountName == rhs.accountName
    }
    
    func search(with text: String) -> Bool {
        return self.accountName == text
    }
    
    init(isSelected:Bool,
         accountName:String,
         typeAccount:String?
    ) {
        
        self.isSelected = isSelected
        self.accountName = accountName
        self.typeAccount = typeAccount
    }
    
    
}
