//
//  SimpleCell.swift
//  BottomSheetExample
//
//  Created by Pham Kien on 18.04.22.
//

import Foundation
import BottomSheetComponent
class BillSimpleCell : BSCPopUpCell {
    
    public var text : String? {
        get {
            return label.attributedText?.string
        }
        set {
            return label.attributedText?.string

        }
    }
    private lazy var label : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        return label
    }()
    
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
    
    func commonInit() {
        backgroundColor = .clear
        contentView.addSubview(stack)
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: topAnchor),
            stack.bottomAnchor.constraint(equalTo: bottomAnchor),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
}
