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
    var calcBrain = CalcultorCore()
    
    func dealError(_ whether: Bool, err: String) {
        
        let errStrAttr: [String: AnyObject] = [NSForegroundColorAttributeName: UIColor.red,
                                            NSFontAttributeName: UIFont(name: "Helvetica", size: 33)]
        var attrErrString = NSMutableAttributedString(string: err, attributes: errStrAttr)
        var attrErrBodyStr = NSMutableAttributedString(string: calcBrain.description, attributes: errStrAttr)
        
        print(attrErrString+attrErrBodyStr)
        
        if whether == false {
            backspaceButton.backgroundColor = self.view.backgroundColor
            backspaceButton.currentTitleColor = UIColor.red

            backspaceButton.isSelected = !backspaceButton.isSelected
            backspaceButton.isHighlighted = !backspaceButton.isHighlighted
            backspaceButton.setTitleColor(UIColor.red, for: UIControlState.highlighted)
        }
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
        if let idx = labelDisplay.text?.index(before: labelDisplay.text!.endIndex) {
            labelDisplay.text = idx <= labelDisplay.text!.startIndex ? "0" :
            labelDisplay.text?.substring(to: idx)
            print(labelDisplay.text!)
        }else {
            labelDisplay.text = "0"
        }
    }
    

    @IBAction func pressUnaryButton(_ sender: UIButton) {
            calcBrain.description = labelDisplay.text!
let retValue = calcBrain.doMath(sender.currentTitle!, num: calcBrain.accumulator)

        dealError(retValue, err: "hello" )
    }

    
    
    
    
    
}

