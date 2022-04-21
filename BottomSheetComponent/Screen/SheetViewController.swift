//
//  SheetViewController.swift
//  BottomSheetComponent
//
//  Created by Pham Kien on 17.04.22.
//

import UIKit

public class SheetViewController: UIViewController {

    
    public override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
  public func configurePopUp<Item:PopupSectionModel,Cell:BSCPopUpCell> (
        title:String,
        canSearch:Bool,
        cellClass:Cell.Type,
        dataSource:[Item],
        configCell : @escaping ((Cell,Item,Int) -> Void),
        onSelectItem : @escaping ((Item,_ index:Int) -> Void)
    
    ) {
        let popup = BSCPopUp<Item,Cell>.init(frame:CGRect(x: 0, y: 0, width: <#T##Double#>, height: <#T##Double#>) )
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
