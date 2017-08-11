//
//  SettingsViewController.swift
//  tippy
//
//  Created by Lopez, Ross on 8/10/17.
//  Copyright © 2017 Lopez, Ross. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTip: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func updateDefaultSettings(_ sender: Any) {
        let selectedTip = defaultTip.selectedSegmentIndex
        
        let defaults = UserDefaults.standard
        
        defaults.set(selectedTip, forKey: "defaultTip")
        defaults.synchronize()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        let defaults = UserDefaults.standard
        let intValue = defaults.integer(forKey: "defaultTip")
        
        defaultTip.selectedSegmentIndex = intValue
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
