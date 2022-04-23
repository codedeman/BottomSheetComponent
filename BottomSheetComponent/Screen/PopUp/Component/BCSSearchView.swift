//
//  SearchView.swift
//  BottomSheetComponent
//
//  Created by Pham Kien on 21.04.22.
//

import Foundation
import UIKit


protocol SearchBarDelegate : AnyObject {
    func searchBarTextBeginChange(_ searchBar: BCSSearchView)
    func searchBarTextDidChange(_ searchBar: BCSSearchView)
    func searchBarEndEditting(_ searchBar: BCSSearchView)
    func searchBarEndButtonDidTap()
}

extension SearchBarDelegate {
    // Optional Delegeted
    func searchBarEndButtonDidTap() { return }
}

class BCSSearchView:UIView{
    public weak var delegate: SearchBarDelegate?
    
    private let imageView : UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "ic_magnifier")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var textField:UITextField = {
        let txtView = UITextField()
        txtView.translatesAutoresizingMaskIntoConstraints = false
//        txtView.delegate = self
        txtView.placeholder = "Search"
        return txtView
        
    }()

    var buttonSearch:UIButton = {
        let button = UIButton()
        button.setTitle("", for: .normal)
        button.setImage(UIImage(named: "icSearch"), for: .normal)
        return button
    }()




    override init(frame: CGRect) {
        super.init(frame: frame)
        initUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initUI() {
        self.backgroundColor = .gray
        textField.delegate = self

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



extension BCSSearchView : UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        delegate?.searchBarTextBeginChange(self)
//        layer.borderColor = UIColor(red: 194/255, green: 168/255, blue: 124/255, alpha: 0.7).cgColor
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        delegate?.searchBarEndEditting(self)
        layer.borderColor = UIColor.white.withAlphaComponent(0.8).cgColor
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        delegate?.searchBarEndButtonDidTap()
        return true
    }
}
