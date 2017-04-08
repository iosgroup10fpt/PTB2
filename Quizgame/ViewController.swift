//
//  ViewController.swift
//  Quizgame
//
//  Created by Cntt23 on 4/8/17.
//  Copyright © 2017 ThanhKhoa. All rights reserved.
//

import UIKit
import Darwin
import Foundation

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var numberA: UITextField!
    @IBOutlet weak var numberB: UITextField!
    @IBOutlet weak var numberC: UITextField!
    @IBOutlet weak var kq: UILabel!
    @IBOutlet weak var kq2: UILabel!
    @IBAction func excute(_ sender: Any) {
        kq.isHidden = true
        kq2.isHidden = true
        
        var temp:Double! = 0
        var temp1:Double! = 0
        if( numberA.text == "" || numberB.text == "" || numberC.text == "" || numberA.text == "-" || numberB.text == "-" || numberC.text == "-" || numberA.text == "-0" || numberB.text == "-0" || numberC.text == "-0"){
            kq.isHidden = false
            kq.text = "Please input number"
        }
        else{
            let a:Double = Double(numberA.text!)!
            let b:Double = Double(numberB.text!)!
            let c:Double = Double(numberC.text!)!
            let D = b*b - 4*a*c
            if( a == 0){
                kq.isHidden = false
                if( b == 0 ){
                    kq.text = "Number A and Number B different 0"
                    
                }
                else{
                    temp = Double(-c)/Double(b)
                    NSLog(" a =0 and b= 0:" + String(temp))
                    kq.text = String(format: "%.2f", temp)
                }
                
                
                
            }
            if( a != 0 && b != 0){
                NSLog(" a khac 0 and B khac 0")
                if(D < 0){
                    kq.isHidden = false
                    kq.text = "Phuong Trinh Vo Nghiem"
                    
                }
                    //            test 1
                else if(D == 0){
                    NSLog(String(temp))
                    temp = Double(-b)/Double((2*a))
                    kq.isHidden = false
                    kq.text = String(format: "%.2f", temp)
                    
                }
                else{
                    temp = Double(-b) + sqrt(Double(D))/Double((2*a))
                    temp1 = Double(-b) - sqrt(Double(D))/Double((2*a))
                    NSLog(String(temp))
                    NSLog(String(temp1))
                    kq.isHidden = false
                    kq2.isHidden = false
                    kq.text = String(format: "%.2f", temp)
                    kq2.text = String(format: "%.2f", temp1)
                    
                    }

                }
        
            }
        }
    override func viewDidLoad() {
        super.viewDidLoad()
        kq.isHidden = true
        kq2.isHidden = true
        self.numberA.delegate = self;
        self.numberB.delegate = self;
        self.numberC.delegate = self;
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let aSet = NSCharacterSet(charactersIn:"0123456789.-").inverted
        let compSepByCharInSet = string.components(separatedBy: aSet)
        let numberFiltered = compSepByCharInSet.joined(separator: "")
        return string == numberFiltered
    }


}

