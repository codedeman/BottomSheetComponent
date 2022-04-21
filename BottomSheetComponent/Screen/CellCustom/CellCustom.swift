//
//  CellCustom.swift
//  BottomSheetComponent
//
//  Created by Pham Kien on 21.04.22.
//

import UIKit


class CellCustom:UITableViewCell {
    
    private lazy var label : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        return label
    }()
    
    
    
//
    private lazy var stack : UIStackView = {
        let stack = UIStackView(arrangedSubviews: [label])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = 12
        stack.layoutMargins = UIEdgeInsets(top: 12, left: 0, bottom: 12, right: 0)
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()
    
    
    public var text : String? {
        get {
            return label.attributedText?.string
        }
        set {
            return label.text = text
        }
    }
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        commonInit()
    }
    
    func commonInit() {
        self.addSubview(stack)
        self.stack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        self.stack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        self.stack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        self.stack.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
    }
}
