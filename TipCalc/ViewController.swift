//
//  ViewController.swift
//  TipCalc
//
//  Created by Park, Young on 3/2/17.
//  Copyright © 2017 Park, Young. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billText: UITextField!
    @IBOutlet weak var tipText: UILabel!
    @IBOutlet weak var totalText: UILabel!
    
    @IBOutlet weak var personText: UITextField!
    
    @IBOutlet weak var payText: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    var bill = Double(0)
    var pay = Double(0)
    var total = Double(0)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func doCalculation(sender: AnyObject) {
        bill = Double(billText.text!) ?? 0
        let tipPercentages = [0.1, 0.15, 0.2, 0.22]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        total = bill + tip
        tipText.text = String(format: "$%.2f", tip)
        totalText.text = String(format: "$%.2f", total)
        let person = Double(personText.text!) ?? 1
        updatePerson(person)
        
    }
    @IBAction func touchBill(sender: AnyObject) {
        bill = 0
        billText.text = ""
    }
    func updatePerson(person: Double){
        personText.text = String(format: "%.f", person)
        pay = total / person
        payText.text = String(format: "$%.2f", pay)
    }
    @IBAction func plusAction(sender: AnyObject) {
        var person =  Double(personText.text!) ?? 1
        person = person + 1 ;
        updatePerson(person)
    }
    
    @IBAction func minusAction(sender: AnyObject) {
        var person =  Double(personText.text!) ?? 1
        if person > 1 {
            person = person - 1 ;
            updatePerson(person)
        }
    }
    
    @IBAction func tapAction(sender: AnyObject) {
        view.endEditing(true)
    }


}

