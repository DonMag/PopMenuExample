//
//  ViewController.swift
//  PopMenuExample
//
//  Created by Mike Derr on 11/3/16.
//  Copyright © 2016 Mike Derr. All rights reserved.
//

import UIKit

// custom delegate to send selected menu item ID back to the presenting controller

protocol PopoverMenuDelegate: class {
	func menuItemSelected(itemID: Int)
}

class ViewController: UIViewController, UIPopoverPresentationControllerDelegate, PopoverMenuDelegate {
    
    @IBOutlet weak var label: UILabel!
	
	var calendarOptsArray: [String] = ["Today", "Week", "Month", "None"]
	var someOtherOptsArray: [String] = ["First", "Second", "Third", "Last"]

	var calendarCurrentSelection: Int = 0
	var someOtherCurrentSelection: Int = 0
	
	var currentMenuType: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
		
    }
	
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

	// this function conforms to our custom PopoverMenuDelegate protocol and will be called by the "popover" menu
	func menuItemSelected(itemID: Int) {
		
		var arrayRef: [String] = []
		
		if self.currentMenuType == 1 {

			self.someOtherCurrentSelection = itemID
			
			arrayRef = self.someOtherOptsArray
			
		} else {

			self.calendarCurrentSelection = itemID
			
			arrayRef = self.calendarOptsArray
			
		}
		
		// dismiss the popover menu
		self.dismissViewControllerAnimated(true, completion: nil)
		
		self.label.text = "menu \(itemID) selected: \(arrayRef[itemID])"
		
	}
	
	@IBAction func tableViewMenuButtonTapped(sender: AnyObject) {
		
		guard let btn = sender as? UIButton else { return }
		
		self.currentMenuType = btn.tag
		
		// instantiate the popover menu view controller
		let vc = PopMenuTableViewController()
		
		// set the desired size and background color
		vc.preferredContentSize = CGSize(width: 140, height: 180)
		vc.view.backgroundColor = UIColor.lightGrayColor()
		
		// set the custom PopoverMenuDelegate to self
		vc.menuDelegate = self
		
		// tell the popover what data to use
		// and which item is currently selected
		if self.currentMenuType == 1 {
			vc.dataArray = self.someOtherOptsArray
			vc.checkMarkIndex = self.someOtherCurrentSelection
		} else {
			vc.dataArray = self.calendarOptsArray
			vc.checkMarkIndex = self.calendarCurrentSelection
		}
		
		// set the popover "styling"
		vc.modalPresentationStyle = .Popover
		
		vc.popoverPresentationController?.backgroundColor = UIColor.lightGrayColor()
		
		// tell it what object to use as the popover "pointy thingy" reference
		vc.popoverPresentationController?.sourceView = self.view
		vc.popoverPresentationController?.sourceRect = btn.frame
		
		// set the UIPopoverPresentationControllerDelegate to self
		vc.popoverPresentationController?.delegate = self
		
		// show the popover menu
		presentViewController(vc, animated: true, completion: nil)
		
	}
	
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return .None
    }

}

