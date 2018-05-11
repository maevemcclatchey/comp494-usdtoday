//
//  MyCalendarController.swift
//  USDToday
//
//  Created by Maeve McClatchey on 5/2/18.
//  Copyright © 2018 University of San Diego. All rights reserved.
//

import Foundation
import UIKit
import JTAppleCalendar

class MyCalendarController: UIViewController {
    
    var daySelected = ""
    
    @IBOutlet weak var day1Button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mySegue"{
            let selectedDay = segue.destination as! MyDayController
            selectedDay.navigationItem.title = daySelected
        }
        if segue.identifier == "addNewEvent"{
            let dest = segue.destination as! NewEventViewController
            dest.navigationItem.title = "New Event"
        }
    }
    @IBAction func day1ButtonPressed(_ sender: Any) {
        daySelected = "Day 1"
        performSegue(withIdentifier: "mySegue", sender: self)
    }
    @IBAction func day2ButtonPressed(_ sender: Any) {
        daySelected = "Day 2"
        performSegue(withIdentifier: "mySegue", sender: self)
    }
    @IBAction func day3ButtonPressed(_ sender: Any) {
        daySelected = "Day 3"
        performSegue(withIdentifier: "mySegue", sender: self)
    }
    
    @IBAction func addEventPressed(_ sender: Any) {
        performSegue(withIdentifier: "addNewEvent", sender: self)
    }
    
}
