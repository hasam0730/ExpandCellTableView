//
//  SecondViewController.swift
//  ExpandCellTableView
//
//  Created by hieu nguyen on 7/5/18.
//  Copyright © 2018 hieu nguyen. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let datasource = ExpandableCellDatasource(data: mockData)
    let delegate = ExpandableCellDelegate(height: 50.0, data: mockData)
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        tableView.dataSource = datasource
        tableView.delegate = delegate
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
