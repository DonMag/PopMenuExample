//
//  PopMenuTableViewController.swift
//  PopMenuExample
//
//  Created by Don Magnusson on 11/4/16.
//  Copyright © 2016 Mike Derr. All rights reserved.
//

import UIKit

class PopMenuTableViewController: UITableViewController {

	var dataArray: [String] = ["Today", "Week", "Month", "None"]
	
	weak var menuDelegate: PopoverMenuDelegate?
	
    override func viewDidLoad() {
        super.viewDidLoad()

		tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
		
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)

        // Configure the cell...

		cell.textLabel?.text = dataArray[indexPath.row]
		
        return cell
    }

	override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		self.menuDelegate?.menuItemSelected(indexPath.row)
	}


}