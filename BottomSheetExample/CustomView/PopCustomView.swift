//
//  PopCustomView.swift
//  BottomSheetExample
//
//  Created by Pham Kien on 01.05.22.
//

import UIKit

class PopCustomView: UIView {

    
    @IBOutlet weak var vHeader: UIView!
    @IBOutlet weak var tableView: UITableView!
    override  func awakeFromNib() {
        super.awakeFromNib()
        
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        let gradient = CAGradientLayer()
        let sizeLength = UIScreen.main.bounds.size.height * 2
        let defaultNavigationBarFrame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 64)

        gradient.frame = defaultNavigationBarFrame
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
//        gradient.locations =  [0.0,0.5,1.0]#004b2c
        gradient.colors = [UIColor.init(hexaRGB: "#84c113", alpha: 1)?.cgColor,UIColor.init(hexaRGB: "#004d29", alpha: 1)?.cgColor]
        
        self.vHeader.layer.insertSublayer(gradient, at: 0)
        
        self.layer.cornerRadius = 10
        self.clipsToBounds = true

    }
    
    func imageFromLayer(layer:CALayer) -> UIImage {
        
        UIGraphicsBeginImageContext(layer.frame.size)

            layer.render(in: UIGraphicsGetCurrentContext()!)

            let outputImage = UIGraphicsGetImageFromCurrentImageContext()

            UIGraphicsEndImageContext()

            return outputImage!

        
    }

}

extension PopCustomView:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell") ?? UITableViewCell()
        cell.textLabel?.text = "One two "
        return cell
    }
    
}



extension UIColor {
    
    convenience init?(hexaRGB: String, alpha: CGFloat = 1) {
        var chars = Array(hexaRGB.hasPrefix("#") ? hexaRGB.dropFirst() : hexaRGB[...])
        switch chars.count {
        case 3: chars = chars.flatMap { [$0, $0] }
        case 6: break
        default: return nil
        }
        self.init(red: .init(strtoul(String(chars[0...1]), nil, 16)) / 255,
                green: .init(strtoul(String(chars[2...3]), nil, 16)) / 255,
                 blue: .init(strtoul(String(chars[4...5]), nil, 16)) / 255,
                alpha: alpha)
    }
}


