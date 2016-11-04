//
//  ViewController.swift
//  PopMenuExample
//
//  Created by Mike Derr on 11/3/16.
//  Copyright © 2016 Mike Derr. All rights reserved.
//
// https://www.youtube.com/watch?v=ZPjFhi-S7aM
//

import UIKit

class ViewController: UIViewController, UIPopoverPresentationControllerDelegate, CalendarTypePopoverDelegate {
    
    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
		
    }
	
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

	// this function conforms to our custom CalendarTypePopoverDelegate protocol and will be called by the "popover" menu
	func calendarTypeSelected(typeID: Int) {
		
		var vString: String = ""
		
		switch typeID {
		case 1:
			vString = "menu 1 selected: Today"
		case 2:
			vString = "menu 2 selected: Week"
		case 3:
			vString = "menu 3 selected: Month"
		default:
			vString = "menu 4 selected: None"
		}
		
		// dismiss the popover menu
		self.dismissViewControllerAnimated(true, completion: nil)
		
		self.label.text = vString
		
	}
	
	@IBAction func regularMenuButtonTapped(sender: AnyObject) {
		
		guard let btn = sender as? UIButton else { return }

		// instantiate the popover menu view controller
		let vc = storyboard?.instantiateViewControllerWithIdentifier("PopMenuViewController") as! PopMenuViewController
		
		// set the desired size and background color
		vc.preferredContentSize = CGSize(width: 100, height: 170)
		vc.view.backgroundColor = UIColor.lightGrayColor()
		
		// set the custom CalendarTypePopoverDelegate to self
		vc.menuDelegate = self
		
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
	
    @IBAction func menuButtonTapped(sender: AnyObject) {
		
		// instantiate the popover menu view controller
        let vc = storyboard?.instantiateViewControllerWithIdentifier("PopMenuViewController") as! PopMenuViewController
		
		// set the desired size and background color
        vc.preferredContentSize = CGSize(width: 100, height: 170)
        vc.view.backgroundColor = UIColor.lightGrayColor()
		
		// set the custom CalendarTypePopoverDelegate to self
		vc.menuDelegate = self

		// set the popover "styling"
		vc.modalPresentationStyle = .Popover
		
		vc.popoverPresentationController?.backgroundColor = UIColor.lightGrayColor()
		
		// tell it what object to use as the popover "pointy thingy" reference
		vc.popoverPresentationController?.barButtonItem = sender as? UIBarButtonItem

		// set the UIPopoverPresentationControllerDelegate to self
		vc.popoverPresentationController?.delegate = self

		// show the popover menu
		presentViewController(vc, animated: true, completion: nil)

    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return .None
    }

}

