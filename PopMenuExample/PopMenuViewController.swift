//
//  PopMenuViewController.swift
//  PopMenuExample
//
//  Created by Mike Derr on 11/3/16.
//  Copyright © 2016 Mike Derr. All rights reserved.
//

import UIKit

// custom delegate to send selected menu item ID back to the presenting controller

protocol CalendarTypePopoverDelegate: class {
	func calendarTypeSelected(typeID: Int)
}


class PopMenuViewController: UIViewController {
    
    @IBOutlet weak var buttonMenu1: UIButton!
    @IBOutlet weak var buttonMenu2: UIButton!
	
	weak var menuDelegate: CalendarTypePopoverDelegate?
	
	// we've assigned each menu button a unique tag ( 1 to 4 )
	// that way we have ONE IBAction that all 4 buttons call, instead of FOUR duplicate functions
	
	@IBAction func menuButtonTapped(sender: AnyObject) {
		
		guard let btn = sender as? UIButton else { return }
		
		let btnID = btn.tag
		
		self.menuDelegate?.calendarTypeSelected(btnID)
		
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        buttonMenu1.setTitleColor(UIColor.yellowColor(), forState: UIControlState.Normal)
        buttonMenu2.setTitleColor(UIColor.yellowColor(), forState: UIControlState.Normal)
		
        // can set menu title programatically also!
       // buttonMenu1.setTitle("Button Title", forState: UIControlState.Normal)

    }

}
