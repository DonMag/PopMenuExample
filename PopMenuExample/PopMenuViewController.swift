//
//  PopMenuViewController.swift
//  PopMenuExample
//
//  Created by Mike Derr on 11/3/16.
//  Copyright © 2016 Mike Derr. All rights reserved.
//

import UIKit

let menu1TappedDone = "menu1TappedDone"
let menu2TappedDone = "menu2TappedDone"
let menu3TappedDone = "menu3TappedDone"
let menu4TappedDone = "menu4TappedDone"

class PopMenuViewController: UIViewController {
    
    @IBOutlet weak var buttonMenu1: UIButton!
    @IBOutlet weak var buttonMenu2: UIButton!
 
    @IBAction func menu1Tapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true) { () -> Void in
            NSNotificationCenter.defaultCenter().postNotificationName(menu1TappedDone, object: nil, userInfo: nil)
        }
    }

    @IBAction func menu2Tapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true) { () -> Void in
            NSNotificationCenter.defaultCenter().postNotificationName(menu2TappedDone, object: nil, userInfo: nil)
        }
    }
    
    @IBAction func menu3Tapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true) { () -> Void in
            NSNotificationCenter.defaultCenter().postNotificationName(menu3TappedDone, object: nil, userInfo: nil)
        }
    }
    
    @IBAction func menu4Tapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true) { () -> Void in
            NSNotificationCenter.defaultCenter().postNotificationName(menu4TappedDone, object: nil, userInfo: nil)
        }
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
