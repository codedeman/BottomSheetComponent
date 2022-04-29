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
        return lhs.typeAccount == rhs.typeAccount
    }
    
    func search(with text: String) -> Bool {
        if let typeAccount = self.typeAccount {
            print("tex------ \(text) \(typeAccount)")
            return typeAccount.folded.uppercased() == text.folded.uppercased()
        }
        return false
        
        
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

extension String {
    var folded: String {
        return self.folding(options: .diacriticInsensitive, locale: nil)
                .replacingOccurrences(of: "đ", with: "d")
                .replacingOccurrences(of: "Đ", with: "D")
    }
}

