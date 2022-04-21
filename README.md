##BCSComponent 

first thing first you have to implement frame work look like this 
```swift
import BottomSheetComponent

```
inherit from protocol look like this 
``` swift 
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
``` 

in viewController you want to use you can call func to show BCSComponent look like this 

``` swift 
        let dataSource = [UserModel.init(isSelected: false, accountName: "1010102002", typeAccount: "test"),UserModel.init(isSelected: false, accountName: "1010102002", typeAccount: "test"),UserModel.init(isSelected: false, accountName: "1010102002", typeAccount: "test"),UserModel.init(isSelected: false, accountName: "1010102002", typeAccount: "test")]
        let vc = SheetViewController()
//        
        vc.configurePopUp(title: "Account", canSearch: false, cellClass:BillSimpleCell.self , dataSource: dataSource) { [weak self] cell, model, index in
            cell.label.text = model.accountName
        } onSelectItem: { model, index in
            print("test selected \(model.accountName)")
        }
        
        self.present(vc, animated: true)


```


