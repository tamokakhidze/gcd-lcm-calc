//
//  ViewController.swift
//  miniCalc
//
//  Created by Tamuna Kakhidze on 03.04.24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var switch1: UISwitch!
    @IBOutlet weak var number1: UITextField!
    @IBOutlet weak var number2: UITextField!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    
    @IBAction func `switch`(_ sender: Any) {
        
        if switch1.isOn {
            label1.text = "უდიდესი საერთო გამყოფი"
            switch1.backgroundColor = UIColor.white
            
        }
        
        else {
            label1.text = "უმცირესი საერთო ჯერადი"
            switch1.backgroundColor = UIColor.blue
            switch1.layer.cornerRadius = switch1.frame.height / 2.0
        }
    }
    
    
    
    
    @IBAction func calculateButton(_ sender: Any) {
        
        number1.layer.borderWidth = 1
        number2.layer.borderWidth = 1
        number1.layer.borderColor = UIColor.white.cgColor
        number2.layer.borderColor = UIColor.white.cgColor
        
        guard let num1Text = number1.text, let num2Text = number2.text,
              var num1 = Int(num1Text), var num2 = Int(num2Text)

        else {
            number1.layer.borderWidth = 1
            number2.layer.borderWidth = 1
            number1.layer.borderColor = UIColor.red.cgColor
            number2.layer.borderColor = UIColor.red.cgColor
            return
        }
        
        if label1.text == "უდიდესი საერთო გამყოფი" {
            let gcd = gcd(number1: &num1, number2: &num2)
            answerLabel.text = "პასუხი: " + String(gcd)
        }
        else {
            let lcm = lcm(number1: &num1, number2: &num2)
            answerLabel.text = "პასუხი: " + String(lcm)
        }
        
        
        func gcd(number1: inout Int, number2: inout Int) -> Int {
            var num1 = number1
            var num2 = number2
            while num2 != 0 {
                let temp = num1
                num1 = num2
                num2 = temp % num2
            }
            return num1
        }
        
        func lcm(number1: inout Int, number2: inout Int) -> Int {
            let gcd = gcd(number1: &number1, number2: &number2)
            if gcd != 0 {
                return (number1 * number2) / gcd
            }
            
            return 1
        }
        
    }
    

    
}
