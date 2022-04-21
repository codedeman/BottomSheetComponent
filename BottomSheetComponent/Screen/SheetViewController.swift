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
        self.view.backgroundColor = .clear

        // Do any additional setup after loading the view.
    }
    
    
  public func configurePopUp<Item:PopupSectionModel,Cell:UITableViewCell> (
        title:String,
        canSearch:Bool,
        cellClass:Cell.Type,
        dataSource:[Item],
        configCell : @escaping ((Cell,Item,Int) -> Void),
        onSelectItem : @escaping ((Item,_ index:Int) -> Void)
    ) {
        
//        let cell = CellCustom()
        let popup = BSCPopUp<Item,Cell>()
        self.view.addSubview(popup)
        popup.dataSource = dataSource
        popup.configureCell = configCell
        popup.selectHandler = onSelectItem
        popup.translatesAutoresizingMaskIntoConstraints = false
        popup.backgroundColor = .red
        popup.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        popup.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        popup.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        popup.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 30).isActive = true
        
       
        
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
