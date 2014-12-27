//
//  ViewController.swift
//  tipit
//
//  Created by William Seo on 12/23/14.
//  Copyright (c) 2014 willseo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var splitTotal: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var splitBillControl: UISegmentedControl!
    
    var splitThreshhold: Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var currentTipPercentage = getDefaultTipPercentage()
        updateTipControlSelectedSegmentIndex(currentTipPercentage)
        splitThreshhold = 1
        setTipAmountLabel()
        
        totalLabel.text = defaultTotalLabelText
        tipLabel.text = defaultTipLabelText
        splitTotal.text = defaultSplitTotalLabelText
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        updateTipAndTotalLabel()
        setTipAmountLabel()
    }

    @IBAction func onTipControlValueChanged(sender: AnyObject) {
        updateTipAndTotalLabel()
        setTipAmountLabel()
    }

    @IBAction func onSplitBillControlValueChanged(sender: AnyObject) {
        switch splitBillControl.selectedSegmentIndex
        {
            case 0:
                splitThreshhold = 1
            case 1:
                splitThreshhold = 2
            case 2:
                splitThreshhold = 3
            case 3:
                splitThreshhold = 4
            default:
                break;
        }
        updateTipAndTotalLabel()
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    func updateTipControlSelectedSegmentIndex(tipPercentage: Double) {
        tipControl.selectedSegmentIndex = find(tipPercentages, tipPercentage)!
    }
    
    func updateTipAndTotalLabel() {
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        var billAmount = (billField.text as NSString).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        var splitTotalAmount = total / Double(splitThreshhold)

        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        splitTotal.text = String(format: "$%.2f", splitTotalAmount)
    }
    
    func setTipAmountLabel() {
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        var percentage = tipPercentage * 100
        tipAmountLabel.text = String(format: "Tip (%.f%%):", percentage)
    }
}

