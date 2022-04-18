//
//  ViewController.swift
//  BottomSheetExample
//
//  Created by Pham Kien on 17.04.22.
//

import UIKit
import BottomSheetComponent


class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }

    @IBAction func didTabOpenBottomSheet(_ sender: Any) {
        let dataSource = [UserModel.init(isSelected: false, accountName: "1010102002", typeAccount: "test"),UserModel.init(isSelected: false, accountName: "1010102002", typeAccount: "test"),UserModel.init(isSelected: false, accountName: "1010102002", typeAccount: "test"),UserModel.init(isSelected: false, accountName: "1010102002", typeAccount: "test")]
        let vc = SheetViewController()
        
        vc.configurePopUp(title: "Account", canSearch: false, cellClass: , dataSource: dataSource) { [weak self] cell, model, index in
            
            
        } onSelectItem: { model, index in
            <#code#>
        }

       


        
    }
    

}

