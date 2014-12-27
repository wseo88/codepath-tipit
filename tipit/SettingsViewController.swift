//
//  SettingsViewController.swift
//  tipit
//
//  Created by William Seo on 12/25/14.
//  Copyright (c) 2014 willseo. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var defaultTipPercentage = getDefaultTipPercentage()
        defaultTipControl.selectedSegmentIndex = find(tipPercentages, defaultTipPercentage)!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButtonTapped(sender: AnyObject) {
        dismissView()
    }
    
    @IBAction func onDefaultTipControlValueChanged(sender: AnyObject) {
        var tipPercentage = tipPercentages[defaultTipControl.selectedSegmentIndex]
        setDefaultTipPercentage(tipPercentage)
    }

    func dismissView() {
        dismissViewControllerAnimated(true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
