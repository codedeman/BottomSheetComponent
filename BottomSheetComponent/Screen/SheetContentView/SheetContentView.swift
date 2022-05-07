//
//  SheetContentView.swift
//  BottomSheetComponent
//
//  Created by Kevin on 12/19/22.
//

import UIKit

public class BSSheetContentViewController: UIViewController {
    
    public private(set) var childViewController: UIViewController
    private var options: BSOptions
    public var contentView = UIView()
    private (set) var preferredHeight: CGFloat

    public init(childViewController: UIViewController
                ,options: BSOptions) {
        self.childViewController = childViewController
        self.options = options
        self.preferredHeight = 0
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpContentView() {
        self.view.addSubview(self.contentView)

    }
    
}
