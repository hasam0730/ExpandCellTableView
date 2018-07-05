//
//  ExpandableCellTableView.swift
//  ExpandCellTableView
//
//  Created by hieu nguyen on 7/5/18.
//  Copyright © 2018 hieu nguyen. All rights reserved.
//

import Foundation
import UIKit


class ExpandableCellDatasource: NSObject, UITableViewDataSource {
    var dataGroup: [ServiceGroup]?
    
    override init() {
        self.dataGroup = [ServiceGroup]()
    }
    
    init(data: [ServiceGroup]) {
        self.dataGroup = data
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataGroup?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.dataGroup != nil {
           return self.dataGroup![section].serviceItemsList!.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.register(UITableViewCell.self)
        let cell = tableView.dequeue(UITableViewCell.self, for: indexPath)
        cell.textLabel?.text = "\(dataGroup![indexPath.section].serviceItemsList![indexPath.row]): cell for row at indexpath"
        return cell
    }
}

class ExpandableCellDelegate: NSObject, UITableViewDelegate {
    var height: CGFloat
    var dataGroup: [ServiceGroup]?
    var previousExpandedIndex: Int?
    var previousSelectedIndex: Int?
    
    override init() {
        self.height = 50.0
        self.dataGroup = [ServiceGroup]()
    }
    
    init(height: CGFloat, data: [ServiceGroup]) {
        self.height = height
        self.dataGroup = data
    }
    
    // header
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return height
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let viewHeader = ExpandableHeaderView()
        let title = "\(dataGroup![section].groupTitlte! ): viewForHeaderInSection"
        viewHeader.frame = CGRect(origin: CGPoint.zero, size: CGSize(width: tableView.frame.width, height: 50))
        viewHeader.customInit(title: title, iconName: "", section: section, delegate: self, tbv: tableView)
        return viewHeader
    }
    
    // footer
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    // row
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if dataGroup![indexPath.section].expanded == true {
            return 50.0
        } else {
            return 0
        }
    }
}

extension ExpandableCellDelegate: ExpandableHeaderViewDelegate {
    func toggleSection(section: Int, in tbv: UITableView) {
        if let uwrIndex = previousSelectedIndex {
            let currv = tbv.headerView(forSection: section) as! ExpandableHeaderView
            let previousv = tbv.headerView(forSection: uwrIndex) as? ExpandableHeaderView
            if uwrIndex != section {
                if currv.imgIcon.transform == .identity {
                    currv.imgIcon.transform = CGAffineTransform(rotationAngle: .pi)
                }
                previousv?.imgIcon.transform = .identity
            }
        }
        previousSelectedIndex = section
        
        tbv.beginUpdates()
        // Hide rows of another sections
        for i in 0 ..< dataGroup!.count where section != i && dataGroup![i].expanded == true {
            dataGroup![i].expanded = false
            for j in 0 ..< dataGroup![i].serviceItemsList!.count
            {
                tbv.reloadRows(at: [IndexPath(row: j, section: i)], with: .automatic)
            }
        }
        
        // Expand od hide rows of the selected section
        dataGroup![section].expanded = !dataGroup![section].expanded
        for i in 0 ..< dataGroup![section].serviceItemsList!.count {
            tbv.reloadRows(at: [IndexPath(row: i, section: section)], with: .automatic)
        }
        tbv.endUpdates()
    }
}
