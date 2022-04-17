//
//  BSCPopUp.swift
//  BottomSheetComponent
//
//  Created by Pham Kien on 17.04.22.
//

import Foundation
import UIKit
class BSCPopUpCell : UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        
    }
}

final class BSCPopUp<Item:PopupSectionModel,Cell:BSCPopUpCell>:UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    public var dataSource : [Item] = []
    public var configureCell : ((Cell, Item, Int) -> Void)?

    private lazy var tableView : UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.alwaysBounceVertical = true
        table.alwaysBounceHorizontal = false
        table.keyboardDismissMode = .onDrag
        table.showsVerticalScrollIndicator = false
        table.showsHorizontalScrollIndicator = false
        table.backgroundColor = .none
        table.delegate = self
        table.dataSource = self
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(Cell.self, forCellReuseIdentifier: "\(Cell.self)")

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = dataSource[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(Cell.self)") as? Cell else {
            fatalError()
        }
        configureCell?(cell,item,indexPath.row)
        return cell
    }
    
    
    
}
