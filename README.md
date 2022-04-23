# BCSComponent 
This Source code provide a bottom sheet which allow you custom own cell,you able to  show it on the bottom sheet 
# Get started 
First thing first you have to implement frame work look like this into your project 
```swift
import BottomSheetComponent

```
Inherit from protocol look like this 
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
    
    func search(with text: String) -> Bool { // in order to use search func 
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

Next Step you declare array with object with **UserModel** is delared above 

``` swift 
        let dataSource = [UserModel.init(isSelected: false, accountName: "1010102002", typeAccount: "test"),
                            UserModel.init(isSelected: false, accountName: "1010102002", typeAccount: "test"),
                            UserModel.init(isSelected: false, accountName: "1010102002", typeAccount: "test"),
                            UserModel.init(isSelected: false, accountName: "1010102002", typeAccount: "test")]
````

In viewController you want to use you can call func to show BCSComponent look like this 

``` swift 
     
        let vc = SheetViewController()
        vc.configurePopUp(title: "Account", canSearch: false, cellClass:BillSimpleCell.self , dataSource: dataSource) { [weak self] cell, model, index in
            cell.label.text = model.accountName // show items on cell 
        } onSelectItem: { model, index in
            print("test selected \(model.accountName)") // handler when you select item on the list 
        }
        
        self.present(vc, animated: true)


```


## Checklist 🎯
- [x] Show cell custom 
- [] Panel to drag smoothly
- [] Search on a list 
- [] Dark mode
- [] Clean code




