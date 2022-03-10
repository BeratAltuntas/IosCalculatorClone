//
//  ViewController.swift
//  Calculator
//
//  Created by BERAT ALTUNTAŞ on 9.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var labelUpperNumber: UILabel!
    @IBOutlet var labelLowerNumbers: UILabel!
    var isclearTapped = false
    var previousOperation = ""
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func Clear(_ sender: Any) {
        if isclearTapped{
            DoMath(operation: "clearLower",whereToWrite: "lower",isFunc: false)
            DoMath(operation: "clearUpper",whereToWrite: "upper",isFunc: false)
            isclearTapped = false
        }else{
            DoMath(operation: "clearLower",whereToWrite: "lower",isFunc: false)
            isclearTapped = true
        }
        
    }
    @IBAction func ReverseNumber(_ sender: Any) {
        
        DoMath(operation: "reverse", isFunc: true)
        previousOperation = "reverse"
    }
    @IBAction func Divide(_ sender: Any) {
        DoMath(operation: "divide", isFunc: true)
        previousOperation = "divide"
    }
    @IBAction func Substraction(_ sender: Any) {
        DoMath(operation: "minus", isFunc: true)
        previousOperation = "minus"
    }
    @IBAction func Equal(_ sender: Any) {
        DoMath(operation: "equal", whereToWrite: "lower", isFunc: false)
    }
    @IBAction func Addition(_ sender: Any) {
        DoMath(operation: "plus", isFunc: true)
        previousOperation = "plus"
    }
    @IBAction func Multiple(_ sender: Any) {
        DoMath(operation: "multi", isFunc: true)
        previousOperation = "multi"
    }
    @IBAction func Mod(_ sender: Any) {
        if labelUpperNumber.text! == "0"{
            DoMath(operation: "clear", whereToWrite: "upper", isFunc: false)
        }
        DoMath(operation: "mod", isFunc: true)
        previousOperation = "mod"
    }
    
    
    @IBAction func point(_ sender: Any) {
        DoMath(operation: ".",whereToWrite: "lower", isFunc: false)
    }
    @IBAction func numberZero(_ sender: Any) {
        DoMath(operation: "0",whereToWrite: "lower", isFunc: false)
    }
    @IBAction func numberOne(_ sender: Any) {
        DoMath(operation: "1",whereToWrite: "lower", isFunc: false)
    }
    @IBAction func numberTwo(_ sender: Any) {
        DoMath(operation: "2",whereToWrite: "lower", isFunc: false)
    }
    @IBAction func numberThree(_ sender: Any) {
        DoMath(operation: "3", whereToWrite: "lower", isFunc: false)
    }
    @IBAction func numberFour(_ sender: Any) {
        DoMath(operation: "4", whereToWrite: "lower", isFunc: false)
    }
    @IBAction func numberFive(_ sender: Any) {
        DoMath(operation: "5", whereToWrite: "lower", isFunc: false)
    }
    @IBAction func numberSix(_ sender: Any) {
        DoMath(operation: "6", whereToWrite: "lower", isFunc: false)
    }
    @IBAction func numberSeven(_ sender: Any) {
        DoMath(operation: "7", whereToWrite: "lower", isFunc: false)
    }
    @IBAction func numberEight(_ sender: Any) {
        DoMath(operation: "8", whereToWrite: "lower", isFunc: false)
    }
    @IBAction func numberNine(_ sender: Any) {
        DoMath(operation: "9", whereToWrite: "lower", isFunc: false)
    }
    
    func DoMath(operation:String,whereToWrite: String? = "lower", isFunc: Bool){
        
        if isFunc{
            let options = DoMath(operation: operation)
            var writeWhere = "upper"
            DoMath(operation: "clearUpper", isFunc: false)
            
            if operation=="reverse"{
                writeWhere = "lower"
            }
            
            for op in options{
                DoMath(operation: String(op),whereToWrite: writeWhere,isFunc: false)
            }
            DoMath(operation: "clearLower", whereToWrite: nil, isFunc: false)
        }
        
        switch operation{
        case "clearLower":
            labelLowerNumbers.text! = "0"
            break
        case "clearUpper":
            labelUpperNumber.text = ""
            break
        case "reverse":
            var number = Int(labelLowerNumbers.text!)
            number! *= -1
            labelLowerNumbers.text! = String(number!)
            break
        case "equal":
            if labelUpperNumber.text!.count>0 && labelLowerNumbers.text!.count>0 && labelLowerNumbers.text! != "0"{
                print(previousOperation,1)
                DoMath(operation: previousOperation, isFunc: true)
                print(previousOperation,2)
            }else{
                if labelUpperNumber.text == "0"{
                    DoMath(operation: "clearLower", isFunc: false)
                    DoMath(operation: "clearUpper", isFunc: false)
                }
                else{
                    labelLowerNumbers.text = labelUpperNumber.text
                }
            }
            break
        case ".":
            let num = Int(labelLowerNumbers.text!)
            if whereToWrite == "upper"{
                labelUpperNumber.text! += "."
            }
            else if num == 0 || labelLowerNumbers.text!.contains("."){
                break
            }else{
                if whereToWrite == "lower"{
                    labelLowerNumbers.text! += "."
                }
            }
            
            break
        case "0":
            let num = Int(labelLowerNumbers.text!)
            if num == 0{
                break
            }else{
                if whereToWrite == "lower"{
                    labelLowerNumbers.text! += "0"
                }
            }
            if whereToWrite == "upper"{
                labelUpperNumber.text! += "0"
            }
            break
        case "1":
            let number = Int(labelLowerNumbers.text!)
            
            if number == 0 && whereToWrite == "lower"{
                labelLowerNumbers.text! = "1"
            }else if whereToWrite == "lower"{
                labelLowerNumbers.text! += "1"
                
            }else if whereToWrite == "upper"{
                labelUpperNumber.text! += "1"
            }
            break
        case "2":
            let number = Int(labelLowerNumbers.text!)
            if number == 0 && whereToWrite == "lower"{
                
                labelLowerNumbers.text! = "2"
                
            }else if whereToWrite == "lower"{
                
                labelLowerNumbers.text! += "2"
                
            }
            else if whereToWrite == "upper"{
                labelUpperNumber.text! += "2"
            }
            break
        case "3":
            let number = Int(labelLowerNumbers.text!)
            
            if number == 0 && whereToWrite == "lower"{
                
                labelLowerNumbers.text! = "3"
            }
            else if whereToWrite == "lower"{
                labelLowerNumbers.text! += "3"
            }
            else if whereToWrite == "upper"{
                labelUpperNumber.text! += "3"
            }
            break
        case "4":
            let number = Int(labelLowerNumbers.text!)
            
            if number == 0 && whereToWrite == "lower"{
                
                labelLowerNumbers.text! = "4"
                
            }else if whereToWrite == "lower"{
                
                labelLowerNumbers.text! += "4"
                
            }else if whereToWrite == "upper"{
                labelUpperNumber.text! += "4"
            }
            
            break
        case "5":
            let number = Int(labelLowerNumbers.text!)
            
            if number == 0 && whereToWrite == "lower"{
                
                labelLowerNumbers.text! = "5"
                
            }else if whereToWrite == "lower"{
                labelLowerNumbers.text! += "5"
            }
            else if whereToWrite == "upper"{
                labelUpperNumber.text! += "5"
            }
            break
        case "6":
            let number = Int(labelLowerNumbers.text!)
            
            if number == 0 && whereToWrite == "lower"{
                
                labelLowerNumbers.text! = "6"
                
            }else if whereToWrite == "lower"{
                
                labelLowerNumbers.text! += "6"
                
            }else if whereToWrite == "upper"{
                labelUpperNumber.text! += "6"
            }
            break
        case "7":
            let number = Int(labelLowerNumbers.text!)
            
            if number == 0 && whereToWrite == "lower"{
                
                labelLowerNumbers.text! = "7"
                
            }else if whereToWrite == "lower"{
                
                labelLowerNumbers.text! += "7"
            }
            else if whereToWrite == "upper"{
                labelUpperNumber.text! += "7"
            }
            break
        case "8":
            let number = Int(labelLowerNumbers.text!)
            
            if number == 0 && whereToWrite == "lower"{
                
                labelLowerNumbers.text! = "8"
                
            }else if whereToWrite == "lower"{
                
                labelLowerNumbers.text! += "8"
            }
            else if whereToWrite == "upper"{
                labelUpperNumber.text! += "8"
            }
            break
        case "9":
            let number = Int(labelLowerNumbers.text!)
            
            if number == 0 && whereToWrite == "lower"{
                
                labelLowerNumbers.text! = "9"
                
            }else if whereToWrite == "lower"{
                
                labelLowerNumbers.text! += "9"
            }
            else if whereToWrite == "upper"{
                labelUpperNumber.text! += "9"
            }
            break
        default:
            break
        }
    }
    func DoMath(operation:String)->String{
        isclearTapped = false
        var upperNum:Float = 0
        var lowerNum:Float = 0
        if labelUpperNumber.text!.count > 0 && labelLowerNumbers.text!.count >= 0 && labelLowerNumbers.text! != "0" {
            let up = Float(labelUpperNumber.text!)
            let low = Float(labelLowerNumbers.text!)
            upperNum = up!
            lowerNum = low!
        }else{
            if labelLowerNumbers.text! == "0" && labelUpperNumber.text!.count>0{
                return labelUpperNumber.text!
            }else{
                return labelLowerNumbers.text!
            }
        }
        
        var result = operation
        if operation == "plus"{
            result = String(Float(upperNum + lowerNum))
        }else if operation == "minus"{
            result = String(Float(upperNum - lowerNum))
        }else if operation == "multi"{
            result = String(Float(upperNum * lowerNum))
        }else if operation == "divide"{
            print(Float(upperNum/lowerNum))
            result = String(Float(upperNum / lowerNum))
            print(result)
        }else if operation == "mod"{
            result = String(Int(upperNum) % Int(lowerNum))
        }else if operation == "reverse"{
            result = String(lowerNum * -1)
        }
        return result
    }
}

