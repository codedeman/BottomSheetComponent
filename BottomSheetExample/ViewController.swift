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
        self.view.backgroundColor = .gray
        
        
        // Do any additional setup after loading the view.
    }

    @IBAction func didTabOpenBottomSheet(_ sender: Any) {
        let dataSource = [UserModel.init(isSelected: false, accountName: "1010102002", typeAccount: "test"),UserModel.init(isSelected: false, accountName: "1010102002", typeAccount: "DEV"),UserModel.init(isSelected: false, accountName: "1010102002", typeAccount: "BA"),UserModel.init(isSelected: false, accountName: "1010102002", typeAccount: "DM")]
        let vc = SheetViewController()
        vc.modalPresentationStyle = .currentContext
        vc.showBCSheet(title: "Account",
                       canSearch: false,
                       cellClass:BillSimpleCell.self ,
                       dataSource: dataSource,
                       roundTop: 20) {  cell, model, index in
            cell.label.text = model.typeAccount
        } onSelectItem: { model, index in
            print("test selected \(String(describing: model.accountName))")
        }
        
        self.present(vc, animated: true)

        
    }
    

}

