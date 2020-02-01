//
//  ViewController.swift
//  Calculator
//
//  Created by Wes on 1/31/20.
//  Copyright © 2020 Revature. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var result  = 0;
    var numbers:[Int] = []
    var userInput: String = "" //Collects the user input and displays it
    var lastOperation: String = ""
    
    //Numbers
    @IBOutlet weak var numZeroBtn: UIButton!
    @IBOutlet weak var numOneBtn: UIButton!
    @IBOutlet weak var numTwoBtn: UIButton!
    @IBOutlet weak var numThreeBtn: UIButton!
    @IBOutlet weak var numFourBtn: UIButton!
    @IBOutlet weak var numFiveBtn: UIButton!
    @IBOutlet weak var numSixBtn: UIButton!
    @IBOutlet weak var numSevenBtn: UIButton!
    @IBOutlet weak var numEightBtn: UIButton!
    @IBOutlet weak var numNineBtn: UIButton!
    
    //UI
    @IBOutlet weak var resultLbl: UILabel!
    
    //Arithmetic
    @IBOutlet weak var plusBtn: UIButton!
    @IBOutlet weak var minusBtn: UIButton!
    @IBOutlet weak var timesBtn: UIButton!
    @IBOutlet weak var divBtn: UIButton!
    @IBOutlet weak var equalsBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//ACTIONS
    @IBAction func inputToNum(_ sender: UIButton) { //Collects user input and display
        if resultLbl.text == "0"{
            resultLbl.text = ""
        }
        if sender == numZeroBtn{
            userInput.append("0")
            resultLbl.text?.append("0")
        }
        if sender == numOneBtn{
            userInput.append("1")
            resultLbl.text?.append("1")
        }
        if sender == numTwoBtn{
            userInput.append("2")
            resultLbl.text?.append("2")
        }
        if sender == numThreeBtn{
            userInput.append("3")
            resultLbl.text?.append("3")
        }
        if sender == numFourBtn{
            userInput.append("4")
            resultLbl.text?.append("4")
        }
        if sender == numFiveBtn{
            userInput.append("5")
            resultLbl.text?.append("5")
        }
        if sender == numSixBtn{
            userInput.append("6")
            resultLbl.text?.append("6")
        }
        if sender == numSevenBtn{
            userInput.append("7")
            resultLbl.text?.append("7")
        }
        if sender == numEightBtn{
            userInput.append("8")
            resultLbl.text?.append("8")
        }
        if sender == numNineBtn{
            userInput.append("9")
            resultLbl.text?.append("9")
        }
    }
    
    @IBAction func appendNumber(_ sender: UIButton) {
        
        if sender == plusBtn{
            if(userInput != ""){
                numbers.append(Int(userInput)!)
            }
            userInput = ""
            resultLbl.text?.append(" + ")
            lastOperation = "+"
        }
        
        if sender == minusBtn{
            if(userInput != ""){
                numbers.append(Int(userInput)! * -1)
            }
            userInput = ""
            resultLbl.text?.append(" - ")
            lastOperation = "-"
        }
        
        if sender == timesBtn{
            if(userInput != ""){
                numbers.append(Int(userInput)!)
            }
            userInput = ""
            resultLbl.text?.append(" x ")
            lastOperation = "x"
        }
        
        if sender == divBtn{
            if(userInput != ""){
                numbers.append(Int(userInput)!)
            }
            userInput = ""
            resultLbl.text?.append(" / ")
            lastOperation = "/"
        }
    }
    
    @IBAction func submitOperation(_ sender: UIButton) {
        if lastOperation.contains("+"){
            print("Adding")
            resultLbl.text = ""
            numbers.append(Int(userInput)!)
            userInput = ""
            result = addNumbers(numberList: numbers)
            resultLbl.text = String(result)
            
        }
        
        if lastOperation.contains("-"){
            print("Substracting")
            resultLbl.text = "-"
            numbers.append(Int(userInput)! * -1)
            userInput = ""
            result = substractNumbers(numberList: numbers)
            resultLbl.text = String(result)
            
        }
        
        if lastOperation.contains("x"){
            print("Mulriply")
            resultLbl.text = ""
            numbers.append(Int(userInput)!)
            userInput = ""
            result = multiplyNumbers(numberList: numbers)
            resultLbl.text = String(result)
            
        }
        
        if lastOperation.contains("/"){
            print("Dividing")
            resultLbl.text = ""
            numbers.append(Int(userInput)!)
            userInput = ""
            result = divideNumbers(numberList: numbers)
            resultLbl.text = String(result)
            
        }
    }
    
    
    //Runs through the whole array and returns a result
    func addNumbers(numberList : [Int]) -> Int{
        var results: Int = 0
        for number in numberList{
            results += number
        }
        numbers.removeAll()
        numbers.append(results)
        return results
    }
    
    func substractNumbers(numberList : [Int]) -> Int{
        var results: Int = 0
        for number in numberList{
            results += number
        }
        printNumlist()
        numbers.removeAll()
        numbers.append(results)
        return results
    }
    
    func multiplyNumbers(numberList : [Int]) -> Int{
        var results: Int = 1
        for number in numberList{
            results *= number
        }
        printNumlist()
        print(results)
        numbers.removeAll()
        numbers.append(results)
        return results
    }
    
    func divideNumbers(numberList : [Int]) -> Int{
        var results: Int = numberList[0]
        for i in 1..<numberList.count	{
            results /= numberList[i]
        }
        numbers.removeAll()
        numbers.append(results)
        return results
    }
    
    func printNumlist(){
        for number in numbers{
            print(String(number) + ", ")
        }
    }

}

