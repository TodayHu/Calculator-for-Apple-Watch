//
//  InterfaceController.swift
//  Calculator WatchKit Extension
//
//  Created by Guanshan Liu on 30/11/2014.
//  Copyright (c) 2014 guanshanliu. All rights reserved.
//

import WatchKit
import Foundation

enum Operation {
    case Unknown, Sum, Subtraction, Multiplication, Division
}

class InterfaceController: WKInterfaceController {

    @IBOutlet weak var resultLabel: WKInterfaceLabel!

    private var previousNumber: String?
    private var displayNumber: String = "0"
    private var operation = Operation.Unknown
    
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
        previousNumber = nil
        displayNumber = "0"
        resultLabel.setText(displayNumber)
        operation = .Unknown
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
        switch operation {
        case .Sum:
            let result = ((previousNumber ?? "0") as NSString).floatValue + (displayNumber as NSString).floatValue
            displayNumber = NSString(format: "%.1f", result)
        case .Subtraction:
            let result = ((previousNumber ?? "0") as NSString).floatValue - (displayNumber as NSString).floatValue
            displayNumber = NSString(format: "%.1f", result)
        case .Multiplication:
            let result = ((previousNumber ?? "0") as NSString).floatValue * (displayNumber as NSString).floatValue
            displayNumber = NSString(format: "%.1f", result)
        case .Division:
            let result = ((previousNumber ?? "0") as NSString).floatValue / (displayNumber as NSString).floatValue
            displayNumber = NSString(format: "%.1f", result)
        case _: break
        }
        resultLabel.setText(displayNumber)
        previousNumber = nil
        operation = .Unknown
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
        previousNumber = displayNumber
        displayNumber = "0"
        resultLabel.setText(displayNumber)
        operation = op
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
