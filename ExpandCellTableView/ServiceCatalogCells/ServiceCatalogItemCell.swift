//
//  CatalogItemCell.swift
//  GoFixCustomer
//
//  Created by hieu nguyen on 6/14/18.
//  Copyright © 2018 gofix.vinova.sg. All rights reserved.
//

import UIKit

class ServiceCatalogItemCell: UITableViewCell {

    @IBOutlet weak var lblContent: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config(with data: String) {
        lblContent.text = data
    }
    
}
