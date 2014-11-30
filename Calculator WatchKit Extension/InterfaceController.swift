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

    @IBOutlet weak var resultLabel: WKInterfaceLabel!
    private var displayNumber: String = "0"
    
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
        Calc.shared.clear()
        displayNumber = "0"
        resultLabel.setText(displayNumber)
    }

    @IBAction func remove() {
        if countElements(displayNumber) <= 1 {
            displayNumber = "0"
        } else {
            displayNumber = displayNumber.substringToIndex(advance(displayNumber.endIndex, -1))
        }
        resultLabel.setText(displayNumber)
    }

    @IBAction func sum() {
        saveOperation(.Sum)
    }

    @IBAction func subtract() {
        saveOperation(.Subtraction)
    }

    @IBAction func multiply() {
        saveOperation(.Multiplication)
    }

    @IBAction func divide() {
        saveOperation(.Division)
    }

    @IBAction func decimal() {
        addToDisplay(".")
    }

    @IBAction func equal() {
        Calc.shared.calculate((displayNumber as NSString).floatValue)
        displayNumber = NSString(format: "%.1f", Calc.shared.result)
        resultLabel.setText(displayNumber)
        Calc.shared.clear()
    }

    @IBAction func zero() {
        addToDisplay("0")
    }

    @IBAction func one() {
        addToDisplay("1")
    }

    @IBAction func two() {
        addToDisplay("2")
    }

    @IBAction func three() {
        addToDisplay("3")
    }

    @IBAction func four() {
        addToDisplay("4")
    }

    @IBAction func five() {
        addToDisplay("5")
    }

    @IBAction func six() {
        addToDisplay("6")
    }

    @IBAction func seven() {
        addToDisplay("7")
    }

    @IBAction func eight() {
        addToDisplay("8")
    }

    @IBAction func nine() {
        addToDisplay("9")
    }

    func saveOperation(op: Operation) {
        Calc.shared.result = (displayNumber as NSString).floatValue
        Calc.shared.operation = op
        displayNumber = "0"
        resultLabel.setText(displayNumber)
    }

    func addToDisplay(stringToAdd: String) {
        if stringToAdd == "." {
            if displayNumber.rangeOfString(".") == nil {
                displayNumber = displayNumber.stringByAppendingString(".")
            }
        } else {
            if displayNumber == "0" {
                displayNumber = stringToAdd
            } else {
                displayNumber = displayNumber.stringByAppendingString(stringToAdd)
            }
        }
        resultLabel.setText(displayNumber)
    }

}
