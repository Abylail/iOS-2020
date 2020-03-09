//
//  ViewController.swift
//  calc
//
//  Created by Абылай on 25.01.2020.
//  Copyright © 2020 Абылай. All rights reserved.
//

import UIKit
import Foundation
class ViewController: UIViewController {

    var firstNumber:Double?=nil
    var operationTag:Int?=nil
    var newNumberCheck:Bool = true
    var haveDot:Bool = false
    var number:Double? = nil
    var afterAnswer:Bool = false
    var jastNum:Double = 0
    
    func calculate(){
        if(firstNumber != nil && result.text != "0" && operationTag != nil && result.text != "0."){
            if(number == nil){
                number = Double(result.text!)
            }
            if(operationTag == 1){
                
                firstNumber = firstNumber! + number!
            }
            else if(operationTag == 2){
                firstNumber = firstNumber! - number!
            }
            else if(operationTag == 3){
                firstNumber = firstNumber! * number!
            }
            else if(operationTag == 4){
                firstNumber = firstNumber! / number!
            }
            result.text = String(firstNumber!)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBOutlet weak var result: UILabel!
    
    @IBAction func digits(_ sender: UIButton) {
        if(afterAnswer == true){
            
            afterAnswer = false
            number = nil
            operationTag = nil
            firstNumber = nil
            
            
            if(sender.tag == 10){
                result.text = "0."
                newNumberCheck = false
                haveDot = true
            }
            else if(sender.tag == 0){
                result.text = "0"
                newNumberCheck = true
                haveDot = false
            }
            else{
                result.text = String(sender.tag)
                newNumberCheck = false
                haveDot = false
            }
        }else{
        if(newNumberCheck == true){
            if(sender.tag != 0){
                if(sender.tag == 10){
                    result.text = "0."
                    haveDot = true
                }
                else if(sender.tag != 0){
                    result.text = String(sender.tag)
                }
                newNumberCheck = false
            }
        }
        else{
            if(sender.tag == 10){
                if(haveDot == false){
                    result.text=result.text!+","
                    haveDot = true
                }
            }
            else{
                result.text = result.text! + String(sender.tag)
            }
        }
        }
    }
    
    
    @IBAction func operations(_ sender: UIButton) {
        if(afterAnswer == true){
            operationTag = sender.tag
            
            
            newNumberCheck = true
            afterAnswer = false
        }
        else{
            if(firstNumber == nil){
                if(result.text != "0" && result.text != "0,"){
                    firstNumber = Double(result.text!)
                    operationTag = sender.tag
                
                    newNumberCheck = true
                }
            }
            else{
                calculate()
                
                newNumberCheck = true
                operationTag = sender.tag
                number = nil
            }
        }
    }
    
    @IBAction func Pi() {
        result.text = "3.14159265"
    }
    
    @IBAction func answer() {
        if(afterAnswer == false){
            number = nil
        }
        calculate()
        
        afterAnswer = true
        newNumberCheck = true
        haveDot = false
    }
    
    @IBAction func clear() {
        firstNumber = nil
        newNumberCheck = true
        haveDot = false
        operationTag = nil
        result.text = "0"
    }
    
    @IBAction func procent() {
        if(result.text != "0" && result.text != "0."){
            result.text = String(Double(result.text!)!/100)
        }
    }
    
    @IBAction func Random() {
        result.text = String(Double.random(in: -999999999999 ..< 9999999999999))
    }
}
