//
//  SheetViewController.swift
//  BottomSheetComponent
//
//  Created by Pham Kien on 17.04.22.
//

import UIKit

public protocol BSSheetViewControllerDelegate: AnyObject {
    
    
}

open class BSSheetViewController: UIViewController {
    weak open var delegate: BSSheetViewControllerDelegate?
}


public class SheetViewController: UIViewController {

//    private var vBottomSheet:UIView!
    
    public private (set) var contentViewController: SheetViewController?
    private var options: BSOptions
    private (set) var preferredHeight: CGFloat
    
    public var sizes: [BSSize] = [.intrinsic] {
        didSet {
//            self.updateOrderedSizes()
        }
    }

    public init(viewController: UIViewController,
                sizes: [BSSize] = [.intrinsic],
                options: BSOptions? = nil) {
        let options = options ?? BSOptions.default
        self.preferredHeight = 0
        if let bsSheetViewController = viewController as? SheetViewController  {
            self.contentViewController = bsSheetViewController
        }
        self.options = options
        self.sizes = sizes.count > 0 ? sizes : [.intrinsic]
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .clear
    }
    
//    public init(childViewController: UIViewController,
//                options: SheetOptions) {
//        self.options = options
//        self.childViewController = childViewController
//        self.preferredHeight = 0
//        super.init(nibName: nil, bundle: nil)
//
//        if options.setIntrinsicHeightOnNavigationControllers, let navigationController = self.childViewController as? UINavigationController {
//            navigationController.delegate = self
//        }
//    }
//
//    public required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }

    
  public func showBSCPopup<Item:PopupSectionModel,Cell:UITableViewCell> (
        title:String,
        canSearch:Bool,
        cellClass:Cell.Type,
        dataSource:[Item],
        roundTop:CGFloat,
        configCell : @escaping ((Cell,Item,Int) -> Void),
        onSelectItem : @escaping ((Item,_ index:Int) -> Void)
    ) {
        
        let popup = BSCPopUp<Item,Cell>()
        self.view.addSubview(popup)
        popup.backgroundColor = .white
        popup.dataSource = dataSource
        popup.configureCell = configCell
        popup.selectHandler = onSelectItem
        popup.searchedItemsCache = dataSource
        popup.bscroundTopCorner(roundTop)
        popup.translatesAutoresizingMaskIntoConstraints = false
        popup.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        popup.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        popup.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        popup.heightAnchor.constraint(equalToConstant: 800).isActive = true
        
    }
    
    public func showBSCSheetWithView(uiview:UIView) {
        self.view.backgroundColor = .red
        self.view.bringSubviewToFront(uiview)
        
        
//        uiview.backgroundColor  = .red
//        uiview.translatesAutoresizingMaskIntoConstraints = false
//        uiview.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 0).isActive = true
//        uiview.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: 0).isActive = true
//        uiview.bottomAnchor.constraint(equalTo: self.view.bottomAnchor,constant: 0).isActive = true
//        uiview.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 100).isActive = true
//        self.vBottomSheet = uiview
        let panGesture = UIPanGestureRecognizer(target: self, action:  #selector(handleBottomSheetPan(recognizer:)))

//        self.vBottomSheet.addGestureRecognizer(panGesture)
    }
    
    
    @objc func handleBottomSheetPan(recognizer:UIPanGestureRecognizer) {

        switch recognizer.state {
        case .began: break
//            sheetHeight = sheet.frame.height
        case .changed:
            let translation: CGFloat = recognizer.translation(in: view).y
            
            print("transaction \(translation)")
//            self.vBottomSheet.vvx_nsTop().constant = translation
            break

        case .ended: break
            let translation: CGFloat = recognizer.translation(in: view).y
            print("transaction end  \(translation)")
//            let velocity = gestureRecognizer.velocity(in: view).y
//            if velocity > thresholdVelocityToClose || transition < -(sheetHeight * 0.5) {
//                closeSheet(animated: true) { _ in
//                    self.dismiss(animated: true)
//                }
//            } else {
//                openSheet(animated: true)
//            }
//            transition = 0
//            gestureRecognizer.setTranslation(.zero, in: view)
        default:
            break
        }
    
    
    }
    


}
