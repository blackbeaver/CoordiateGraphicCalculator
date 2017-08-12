//
//  ViewController.swift
//  CoordinateGraphicCalculator
//
//  Created by JiaYanwei on 7/28/17.
//  Copyright © 2017 JiaYanwei. All rights reserved.
//

import UIKit

class CalculatorController: UIViewController {
    
    
    @IBOutlet weak var labelDisplay: UILabel!
    private var isTyping: Bool = false
    private var isDouble: Bool = false
    var calcBrain = CalcultorCore()
    
    func printErrMsg(_ orgin: String, err: String) {
        labelDisplay.text! += "\n" + err
    }
    
    @IBAction func pressNumButton(_ sender: UIButton) {
        if isTyping == false {
            labelDisplay.text = sender.currentTitle!
            isTyping = true
        }else {
            labelDisplay.text! += sender.currentTitle!
        }
    }

    
    @IBAction func pressDotButton(_ sender: UIButton) {
        if isDouble == false {
            labelDisplay.text! += "."
            isDouble = true
            isTyping = true
        }
    }

    
    @IBAction func pressEqualButton(_ sender: UIButton) {
        labelDisplay.text = labelDisplay.text! + " = " + "\(calcBrain.result!)"
    }

    @IBAction func pressUnaryButton(_ sender: UIButton) {
        labelDisplay.text = sender.currentTitle! + "(" + labelDisplay.text! + ")"
        let retValue = calcBrain.doMath(sender.currentTitle!, num: calcBrain.accumulator)
        
//        if sender.currentTitle == "÷" && retValue == false {
            printErrMsg(labelDisplay.text!, err: "hello")
//        }
    }

}

