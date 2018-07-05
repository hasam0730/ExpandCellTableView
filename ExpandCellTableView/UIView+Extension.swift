//
//  UIView+Extension.swift
//  ExpandCellTableView
//
//  Created by hieu nguyen on 7/5/18.
//  Copyright © 2018 hieu nguyen. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    enum UIBorderSide {
        case Top, Bottom, Left, Right
    }
    
    func addLineBorder(side: UIBorderSide, color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        
        switch side {
        case .Top:
            border.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: width)
        case .Bottom:
            border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: width)
        case .Left:
            border.frame = CGRect(x: 0, y: 0, width: width, height: self.frame.size.height)
        case .Right:
            border.frame = CGRect(x: self.frame.size.width - width, y: 0, width: width, height: self.frame.size.height)
        }
        
        layer.addSublayer(border)
        layer.masksToBounds = true
    }
}
