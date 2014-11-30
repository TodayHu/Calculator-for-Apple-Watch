//
//  InterfaceController.swift
//  Calculator WatchKit Extension
//
//  Created by Guanshan Liu on 30/11/2014.
//  Copyright (c) 2014 guanshanliu. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    override init(context: AnyObject?) {
        // Initialize variables here.
        super.init(context: context)
        
        // Configure interface objects here.
        NSLog("%@ init", self)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        NSLog("%@ will activate", self)
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        NSLog("%@ did deactivate", self)
        super.didDeactivate()
    }

    @IBAction func clear() {

    }

    @IBAction func remove() {

    }

    @IBAction func sum() {

    }

    @IBAction func subtract() {

    }

    @IBAction func multiply() {

    }

    @IBAction func divide() {

    }

    @IBAction func decimal() {

    }

    @IBAction func equal() {

    }

    @IBAction func zero() {

    }

    @IBAction func one() {

    }

    @IBAction func two() {

    }

    @IBAction func three() {

    }

    @IBAction func four() {

    }

    @IBAction func five() {

    }

    @IBAction func six() {

    }

    @IBAction func seven() {

    }

    @IBAction func eight() {

    }

    @IBAction func nine() {

    }

}
