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
        
        self.configureBottomSheet()
        
    }
    
    func configureBottomSheet() {
        let sheetComponent = SheetViewController(viewController: self)
    }
    
    

}

