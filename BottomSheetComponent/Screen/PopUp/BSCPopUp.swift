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

final class BSCPopUp<Item:PopupSectionModel,Cell:UITableViewCell>:UIView,UITableViewDelegate,UITableViewDataSource {
    
    public var dataSource : [Item] = []
    public var configureCell : ((Cell, Item, Int) -> Void)?
    public var selectHandler : ((Item,_ index:Int) -> Void)?


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
    
    private lazy var mainStack : UIStackView = {
        let stack = UIStackView(arrangedSubviews: [tableView])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: 0, left: 16, bottom: 24, right: 16)
        stack.axis = .vertical
        stack.spacing = 16
        stack.distribution = .fill
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        self.addSubview(tableView)
        self.addSubview(mainStack)
        mainStack.topAnchor.constraint(equalTo: self.topAnchor, constant: 12).isActive = true
        mainStack.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        mainStack.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        mainStack.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        tableView.register(Cell.self, forCellReuseIdentifier: "\(Cell.self)")
        tableView.separatorColor = .clear
        debugPrint("cell \(Cell.self)")
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        tableView.register(Cell.self, forCellReuseIdentifier: "\(Cell.self)")
//
//    }
    
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let item = dataSource[indexPath.row]
        
        if let select = selectHandler {
            select(item,indexPath.row)
        }
//        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    
}
