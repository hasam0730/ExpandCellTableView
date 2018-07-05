//
//  ExpandableHeaderView.swift
//  GoFixCustomer
//
//  Created by hieu nguyen on 6/27/18.
//  Copyright © 2018 gofix.vinova.sg. All rights reserved.
//

import Foundation
import UIKit

protocol  ExpandableHeaderViewDelegate: class {
    func toggleSection(section: Int, in tbv: UITableView)
}

class ExpandableHeaderView: UITableViewHeaderFooterView {
    
    weak var delegate: ExpandableHeaderViewDelegate?
    var section: Int!
    var imgIcon: UIImageView = UIImageView()
    var flagSelectedGroup: Bool = false
    var tbv: UITableView?
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectHeaderAction)))
        imgIcon.image = UIImage(named: "arrow_up")
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coderL) has not been implemented")
    }
    
    @objc func selectHeaderAction(gestureRecognizer: UITapGestureRecognizer) {
        let cell = gestureRecognizer.view as! ExpandableHeaderView
        flagSelectedGroup = !flagSelectedGroup

        if imgIcon.transform == .identity {
           imgIcon.transform = CGAffineTransform(rotationAngle: .pi)
        } else {
           imgIcon.transform = .identity
        }
        
        delegate?.toggleSection(section: cell.section, in: self.tbv!)
    }
    
    func customInit (title: String, iconName: String, section: Int, delegate: ExpandableHeaderViewDelegate, tbv: UITableView) {
        self.tbv = tbv
        let v = UIView(frame: self.frame)
        v.backgroundColor = .green
        self.addLineBorder(side: .Bottom, color: UIColor.gray, width: 1.0)
        let lblName: UILabel = UILabel(frame: CGRect(x: self.frame.origin.x + 25, y: 0, width: self.bounds.width - 50, height: 50))
        lblName.textColor = UIColor.darkGray
        
        lblName.text = title
        self.addSubview(lblName)
        imgIcon.image = UIImage(named: "arrow_up")?.withRenderingMode(.alwaysOriginal)
        imgIcon.contentMode = .center
        imgIcon.frame = CGRect(x: self.frame.width - 30, y: 10, width: 30, height: 25)
        imgIcon.center.y = self.center.y
        self.addSubview(imgIcon)
        self.backgroundView = v
        self.section = section
        self.delegate = delegate
    }
}
