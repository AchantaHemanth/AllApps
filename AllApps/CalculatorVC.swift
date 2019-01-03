//
//  ViewController.swift
//  CalculatorApp
//
//  Created by Hemanth on 22/12/18.
//  Copyright © 2018 Hemanth. All rights reserved.
//

import UIKit

class CalculatorVC: UIViewController {
    var firstNumber : Double = 0.0
    var secondNumber : Double = 0.0
    var operation = 0
    var status : Bool = false
    var decStatus : Bool = false
    
    @IBOutlet var lbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

   @IBAction func numbers(_ sender: UIButton)
    {
        
        if status == true
        {
            self.lbl.text = String(sender.tag - 1)
            firstNumber = Double(self.lbl.text!)!
            //print(firstNumber)
            self.status = false
        }
        else
        {
            self.lbl.text = lbl.text! + String(sender.tag - 1)
            firstNumber = Double(self.lbl.text!)!
            self.status = true
        }
    }
    
    @IBAction func operation(_ sender: UIButton)
    {
        if lbl.text != "" && sender.tag != 11
        {
            secondNumber = Double(lbl.text!)!
            //print(secondNumber)
            if sender.tag == 12
            {
                lbl.text = "/"
            }
            if sender.tag == 13
            {
                lbl.text = "*"
            }
            if sender.tag == 14
            {
                lbl.text = "-"
            }
            if sender.tag == 15
            {
                lbl.text = "+"
            }
            if sender.tag == 21
            {
                lbl.text = "%"
            }
            operation = sender.tag
            status = true
        }
        else if sender.tag == 11
        {
            lbl.text = ""
            firstNumber = 0.0
            secondNumber = 0.0
            operation = 0
        }
       
        
    }
    
    @IBAction func dotAction(_ sender: UIButton)
    {
        if status == true
        {
            print("First No:\(firstNumber) & Second No:\(secondNumber)")
            var dec = String(format: "%d", Int(firstNumber))
            dec.append(".")
            self.lbl.text = dec
            self.status = false
            decStatus = true
        }
        else
        {
            print("First No:\(firstNumber) & Second No:\(secondNumber)")
            var dec = String(format: "%d", Int(firstNumber))
            dec.append(".")
            self.lbl.text = dec
            decStatus = true
            
        }

        
    }
    
    @IBAction func result(_ sender: UIButton)
    {
        if operation == 12
        {
            print(secondNumber)
            //TODO
            if Int(firstNumber) == 0
            {
                let alert = UIAlertController.init(title: "Warning", message: "Enter Valid Number Otherthan Zero ", preferredStyle: .alert)
                let action = UIAlertAction.init(title: "Ok", style: .cancel, handler: nil)
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
            }
            else
            {
            let result = Int((secondNumber)/(firstNumber))
            self.lbl.text = "\(result)"
            }
        }
        if operation == 13
        {
            let result = Int((secondNumber) * (firstNumber))
            self.lbl.text = "\(result)"
        }
        if operation == 14
        {
            if decStatus == true
            {
                let result = Float((secondNumber) - (firstNumber))
                self.lbl.text = "\(result)"
                decStatus = false
            }
            else
            {
                let result = Int((secondNumber) - (firstNumber))
                self.lbl.text = "\(result)"
            }
        }
        if operation == 15
        {
            if decStatus == true
            {
                let result = Float((secondNumber) + (firstNumber))
                self.lbl.text = "\(result)"
                decStatus = false
            }
            else
            {
                let result = Int((secondNumber) + (firstNumber))
                self.lbl.text = "\(result)"
            }
           
        }
        
        if sender.tag == 18
        {
           let b = isPerfectSquare(sq:firstNumber)
           if b == true
           {
               let result = Int(sqrt(firstNumber))
               self.lbl.text = "\(result)"
           }
           else
           {
            let result = sqrt(firstNumber)
            self.lbl.text = "\(result)"
           }
        }
        if sender.tag == 19
        {
            let result = Int(firstNumber * firstNumber)
            self.lbl.text = "\(result)"
        }
        if sender.tag == 20
        {
            let result = Int(firstNumber * firstNumber * firstNumber)
            self.lbl.text = "\(result)"
        }
        if operation == 21
        {
            let result =  self.reminder(n: Int(secondNumber), d:Int(firstNumber))
            //print(result)
            self.lbl.text = "\(result)"
        }
    }
    
    func reminder(n:Int,d: Int)-> Int
    {
        let q = n%d
        
//        let r = n - (d*q)
        return q
    }
    
    func isPerfectSquare(sq:Double) ->Bool
    {
        //print(sq)
        let p = sqrt(sq)
        if p*p == sq
        {
            return true
        }
        return false
    }
}

