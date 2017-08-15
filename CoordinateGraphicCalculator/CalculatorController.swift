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
    
    @IBOutlet weak var backspaceButton: UIButton!
    private var isTyping: Bool = false
    private var isDouble: Bool = false
    private var labelBackGroundColor: UIColor = UIColor.darkGray
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
    @IBAction func pressBackspace(_ sender: UIButton) {
                labelDisplay.text = labelDisplay.text!.substring(to: labelDisplay.text!.endIndex)
        if labelDisplay.text == nil {
            labelDisplay.text = "0"
        }
    }

    @IBAction func pressUnaryButton(_ sender: UIButton) {
        labelDisplay.text = sender.currentTitle! + "(" + labelDisplay.text! + ")"
//        let retValue =
            calcBrain.doMath(sender.currentTitle!, num: calcBrain.accumulator)
//        if retValue == false {
            labelDisplay.backgroundColor = self.view.backgroundColor
            labelDisplay.textColor = UIColor.red
       backspaceButton.isHighlighted = true
//        }
    
    }

    
    
    
    
    
}

