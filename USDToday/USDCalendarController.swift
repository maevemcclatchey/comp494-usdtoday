//
//  USDCalendarController.swift
//  USDToday
//
//  Created by Maeve McClatchey on 5/2/18.
//  Copyright © 2018 University of San Diego. All rights reserved.
//

import Foundation
import UIKit
import JTAppleCalendar



class USDCalendarController: UIViewController {
    var daySelected = ""
    @IBOutlet weak var day1Button: UIButton!
    
    @IBOutlet weak var day2Button: UIButton!
    
    @IBOutlet weak var day3Button: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "usdSegue"{
            let selectedDay = segue.destination as! UsdDayController
            selectedDay.navigationItem.title = daySelected
            
            
            
        }
    }
    @IBAction func day1ButtonPressed(_ sender: Any) {
        daySelected = "Day 1"
        performSegue(withIdentifier: "usdSegue", sender: self)
    }
    @IBAction func day2ButtonPressed(_ sender: Any) {
        daySelected = "Day 2"
        performSegue(withIdentifier: "usdSegue", sender: self)
    }
    @IBAction func day3ButtonPressed(_ sender: Any) {
        daySelected = "Day 3"
        performSegue(withIdentifier: "usdSegue", sender: self)
    }
    
}
