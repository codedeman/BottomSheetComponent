//
//  SearchView.swift
//  BottomSheetComponent
//
//  Created by Pham Kien on 21.04.22.
//

import Foundation
import UIKit

class BCSSearchView:UIView{
    
    
    private let imageView : UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "ic_magnifier")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var textField:UITextField = {
        let txt = UITextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.placeholder = "Search"
        return txt
        
    }()

    var buttonSearch:UIButton = {
        let button = UIButton()
        button.setTitle("", for: .normal)
        button.setImage(UIImage(named: "icSearch"), for: .normal)
        return button
    }()


//    private lazy var mainStack : UIStackView = {
//        let stack = UIStackView(arrangedSubviews: [txtSearch])
//        stack.translatesAutoresizingMaskIntoConstraints = false
//        stack.isLayoutMarginsRelativeArrangement = true
//        stack.layoutMargins = UIEdgeInsets(top: 0, left: 16, bottom: 24, right: 16)
//        stack.axis = .horizontal
//        stack.spacing = 16
//        stack.distribution = .fill
//        return stack
//    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        initUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initUI() {
        addSubview(imageView)
        addSubview(textField)
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 24),
            imageView.heightAnchor.constraint(equalToConstant: 24),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 12),
           
            textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 48),
            textField.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -48)
        ])
    }
    
    
}
