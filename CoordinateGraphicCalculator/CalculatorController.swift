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
                                               NSFontAttributeName: UIFont(name: "Helvetica", size: 33)!]
        calcBrain.coloredDescription = NSMutableAttributedString(string: labelDisplay.text!)
        let content = "\(calcBrain.result)"
        let length = content.characters.count
        let start = labelDisplay.text!.characters.distance(from: labelDisplay.text!.startIndex, to: labelDisplay.text!.characters.index(of: "(")!)

        calcBrain.coloredDescription?.setAttributes(errStrAttr, range: NSMakeRange(start, length))
//        var attrErrString = NSMutableAttributedString(string: err, attributes: errStrAttr)
//        var attrErrBodyStr = NSMutableAttributedString(string: calcBrain.description!, attributes: errStrAttr)
        
        print(attrErrString.append(attrErrBodyStr))

        
        if whether == false {
            backspaceButton.backgroundColor = self.view.backgroundColor
            
            backspaceButton.isSelected = !backspaceButton.isSelected
            //backspaceButton.isHighlighted = !backspaceButton.isHighlighted
            backspaceButton.setTitleColor(UIColor.red, for: UIControlState.highlighted)
            let tmpStr = NSAttributedString(string: ")")
            attrErrString.insert(tmpStr, at: 0)
            labelDisplay.attributedText = attrErrString
        }
        print(labelDisplay.text!)
        
    }
    
    @IBAction func pressNumButton(_ sender: UIButton) {
        if isTyping == false {
            labelDisplay.text = sender.currentTitle!
            isTyping = true
        }else {
            labelDisplay.text! += sender.currentTitle!
        }
        //calcBrain.description = labelDisplay.text!
        //print(calcBrain.description)
    }
    
    
    @IBAction func pressDotButton(_ sender: UIButton) {
        if isDouble == false {
            labelDisplay.text! += "."
            isDouble = true
            isTyping = true
        }
        //calcBrain.description = labelDisplay.text!
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
//        calcBrain.description = labelDisplay.text!
        labelDisplay.text = sender.currentTitle! + "(" + "\(calcBrain.result)" + ")"
        let retValue = calcBrain.doMath(sender.currentTitle!, num: calcBrain.accumulator)
        
        dealError(false, err: "hello" )
    }

}

