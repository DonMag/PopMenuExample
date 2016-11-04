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

class ViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    
    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        addObservers()
    }
    
    func addObservers() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.menu1(_:)), name: menu1TappedDone, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.menu2(_:)), name: menu2TappedDone, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.menu3(_:)), name: menu3TappedDone, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.menu4(_:)), name: menu4TappedDone, object: nil)
        
    }
    
    func menu1(sender: NSNotification) {
        label.text = "menu 1 selected: Today"
    }
    
    func menu2(sender: NSNotification) {
        label.text = "menu 2 selected: Week"
    }
    
    func menu3(sender: NSNotification) {
        label.text = "menu 3 selected: Month"
    }
    
    func menu4(sender: NSNotification) {
        label.text = "menu 4 selected: None"
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func menuButtonTapped(sender: AnyObject) {
        
        let vc = storyboard?.instantiateViewControllerWithIdentifier("PopMenuViewController") as! PopMenuViewController
        
       // vc.preferredContentSize = CGSize(width: UIScreen.mainScreen().bounds.width, height: 100)
        vc.preferredContentSize = CGSize(width: 100, height: 170)
        vc.view.backgroundColor = UIColor.lightGrayColor()

        let navController = UINavigationController(rootViewController: vc)
        
        navController.modalPresentationStyle = .Popover
        navController.navigationBarHidden = true
        
        let popMenu = navController.popoverPresentationController
        
        popMenu?.backgroundColor  = UIColor.lightGrayColor()

        popMenu?.delegate = self
        popMenu?.barButtonItem = sender as? UIBarButtonItem
        presentViewController(navController, animated: true, completion: nil)
    
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return .None
    }

}

