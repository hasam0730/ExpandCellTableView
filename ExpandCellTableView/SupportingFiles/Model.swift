//
//  Model.swift
//  ExpandCellTableView
//
//  Created by hieu nguyen on 7/5/18.
//  Copyright © 2018 hieu nguyen. All rights reserved.
//

import Foundation

let data: [ServiceCategory] = [ServiceCategory(icon: "tab_task_off", title: "Aircon",
                                               serviceGroupList: [ServiceGroup(groupTitlte: "Supply & Install Power Point Switch",
                                                                               serviceItemsList: ["aircon 1", "aircon 1", "aircon 1", "aircon 1", "aircon 1"], expanded: false),
                                                                  ServiceGroup(groupTitlte: "Supply & Install Power Point Switch",
                                                                               serviceItemsList: ["aircon 1", "aircon 1", "aircon 1", "aircon 1", "aircon 1"], expanded: false),
                                                                  ServiceGroup(groupTitlte: "Supply & Install Power Point Switch",
                                                                               serviceItemsList: ["aircon 1", "aircon 1", "aircon 1", "aircon 1", "aircon 1"], expanded: false)]),
                               ServiceCategory(icon: "tab_task_off", title: "Electrical",
                                               serviceGroupList: [ServiceGroup(groupTitlte: "Electrical Supply & Install Power Point Switch",
                                                                               serviceItemsList: ["aircon 1", "aircon 1", "aircon 1", "aircon 1", "aircon 1"], expanded: false),
                                                                  ServiceGroup(groupTitlte: "Electrical Supply & Install Power Point Switch",
                                                                               serviceItemsList: ["aircon 1", "aircon 1", "aircon 1", "aircon 1", "aircon 1"], expanded: false)]),
                               ServiceCategory(icon: "tab_task_off", title: "Plumbing",
                                               serviceGroupList: [ServiceGroup(groupTitlte: "Plumbing Supply & Install Power Point Switch",
                                                                               serviceItemsList: ["aircon 1", "aircon 1", "aircon 1", "aircon 1", "aircon 1"], expanded: false)]),
                               ServiceCategory(icon: "tab_task_off", title: "Handyman",
                                               serviceGroupList: [ServiceGroup(groupTitlte: "Handyman Supply & Install Power Point Switch",
                                                                               serviceItemsList: ["aircon 1", "aircon 1", "aircon 1", "aircon 1", "aircon 1"], expanded: false)]),
                               ServiceCategory(icon: "tab_task_off", title: "Service5",
                                               serviceGroupList: [ServiceGroup(groupTitlte: "Service 5 Supply & Install Power Point Switch",
                                                                               serviceItemsList: ["aircon 1", "aircon 1", "aircon 1", "aircon 1", "aircon 1"], expanded: false)]),
                               ServiceCategory(icon: "tab_task_off", title: "Service6",
                                               serviceGroupList: [ServiceGroup(groupTitlte: "Service 6 Supply & Install Power Point Switch",
                                                                               serviceItemsList: ["aircon 1", "aircon 1", "aircon 1", "aircon 1", "aircon 1"], expanded: false)]),
                               ServiceCategory(icon: "tab_task_off", title: "Service7",
                                               serviceGroupList: [ServiceGroup(groupTitlte: "Service 7 Supply & Install Power Point Switch",
                                                                               serviceItemsList: ["aircon 1", "aircon 1", "aircon 1", "aircon 1", "aircon 1"], expanded: false)]),
                               ServiceCategory(icon: "tab_task_off", title: "Service",
                                               serviceGroupList: [ServiceGroup(groupTitlte: "Service 8 Supply & Install Power Point Switch",
                                                                               serviceItemsList: ["aircon 1", "aircon 1", "aircon 1", "aircon 1", "aircon 1"], expanded: false)])]

let mockData: [ServiceGroup] = [
    ServiceGroup(groupTitlte: "Supply & Install Power Point Switch", serviceItemsList: ["Supply & Install Power Point Switch 1", "Supply & Install Power Point Switch 2", "Supply & Install Power Point Switch 3"], expanded: false),
    ServiceGroup(groupTitlte: "Supply & Install Power Point Switch", serviceItemsList: ["Supply & Install Power Point Switch 1", "Supply & Install Power Point Switch 2", "Supply & Install Power Point Switch 3"], expanded: false),
    ServiceGroup(groupTitlte: "Supply & Install Power Point Switch", serviceItemsList: ["Supply & Install Power Point Switch 1", "Supply & Install Power Point Switch 2", "Supply & Install Power Point Switch 3"], expanded: false),
    ServiceGroup(groupTitlte: "Supply & Install Power Point Switch", serviceItemsList: ["Supply & Install Power Point Switch 1", "Supply & Install Power Point Switch 2", "Supply & Install Power Point Switch 3"], expanded: false)]
