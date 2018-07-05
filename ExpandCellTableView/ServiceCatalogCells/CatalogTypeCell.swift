//
//  SelectCatalogTypeCell.swift
//  GoFixCustomer
//
//  Created by hieu nguyen on 6/14/18.
//  Copyright © 2018 gofix.vinova.sg. All rights reserved.
//

import UIKit

class CatalogTypeCell: UICollectionViewCell {

    @IBOutlet weak var ivIcon: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    
    var catalog: ServiceCategory? {
        didSet {
            guard let uwrData = catalog else { return }
            lblTitle.text = uwrData.title
            ivIcon.image = UIImage(named: uwrData.icon ?? "")
            backgroundColor = UIColor.brown
        }
    }
    
    var isPicked: Bool = false {
        didSet {
//            guard let uwrData = catalog else { return }
            
        }
    }
    
    private func convertImage(name: String?, to isSelected: Bool) -> String {
        if isSelected {
            return (name ?? "").replacingOccurrences(of: "_off", with: "_on")
        } else {
            return (name ?? "").replacingOccurrences(of: "_on", with: "_off")
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupView()
        contentView.backgroundColor = .white
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        
    }
    
    func setupView() {
        
    }
    
    func configView(with data: ServiceCategory?) {
        
    }
    
}
