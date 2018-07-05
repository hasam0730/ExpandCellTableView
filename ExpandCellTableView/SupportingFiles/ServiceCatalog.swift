//
//  ServiceCatalog.swift
//  GoFixCustomer
//
//  Created by hieu nguyen on 6/20/18.
//  Copyright © 2018 gofix.vinova.sg. All rights reserved.
//

import Foundation
import UIKit

struct ServiceCategory {
    var icon: String?
    var title: String?
    var serviceGroupList: [ServiceGroup]?
}
struct ServiceGroup {
    var groupTitlte: String?
    var serviceItem: [String]?
    var expanded: Bool!
}
