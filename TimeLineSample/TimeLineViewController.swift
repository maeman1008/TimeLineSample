//
//  ViewController.swift
//  TimeLineSample
//
//  Created by ryoto.maeda on 2017/04/10.
//  Copyright © 2017年 ryoto.maeda. All rights reserved.
//

import UIKit

struct TimeLineItem {
    let name: String
    let color: UIColor
}

class TimeLineViewController: UITableViewController {
    
    let timeLineItems = [
        TimeLineItem(name: "item1", color: UIColor.blue),
        TimeLineItem(name: "item2", color: UIColor.green),
        TimeLineItem(name: "item3", color: UIColor.red),
        TimeLineItem(name: "item4", color: UIColor.yellow)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "TimeLineItemCell", bundle: nil), forCellReuseIdentifier: "TimeLineItemCell")
        self.tableView.rowHeight = 120
        self.tableView.estimatedRowHeight = 120
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.timeLineItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TimeLineItemCell", for: indexPath) as! TimeLineItemCell
        let prevItem = self.timeLineItems[safe: indexPath.row - 1]
        let nextItem = self.timeLineItems[safe: indexPath.row + 1]
        cell.newState(item: self.timeLineItems[indexPath.row], prevItem: prevItem, nextItem: nextItem)
        return cell
    }
}

