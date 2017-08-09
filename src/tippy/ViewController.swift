//
//  ViewController.swift
//  tippy
//
//  Created by Lopez, Ross on 7/26/17.
//  Copyright © 2017 Lopez, Ross. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipOptions: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    @IBAction func calculateTip(_ sender: Any) {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .currency
        
        let bill = Double(billField.text!) ?? 0
        let percentage = Double(tipOptions.titleForSegment(at: tipOptions.selectedSegmentIndex)!)
        let tipAmount = bill * percentage! / 100
        if let formattedTipAmount = formatter.string(from: tipAmount as NSNumber) {
            tipLabel.text = "\(formattedTipAmount)"
        }
        let billTotal = bill + tipAmount
        if let formattedTotalAmount = formatter.string(from: billTotal as NSNumber){
            totalLabel.text = "\(formattedTotalAmount)"
        }
    }
    @IBAction func tipAmountChanged(_ sender: Any) {
        calculateTip(sender)
    }
    


}

