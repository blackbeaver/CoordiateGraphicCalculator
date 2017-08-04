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
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

