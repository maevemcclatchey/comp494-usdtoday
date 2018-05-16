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
    
    let formatter = DateFormatter()
    @IBOutlet weak var calendarView: JTAppleCalendarView!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var month: UILabel!
    
    let outsideMonthColor = UIColor.gray
    let monthColor = UIColor.white
    let selectedMonthColor = UIColor.black
    let currentDateSelectedViewColor = UIColor.blue
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCalendarView()
    }
    
    func setUpCalendarView(){
        // set up calendar spacing
        calendarView.minimumLineSpacing = 0
        calendarView.minimumInteritemSpacing = 0
        
        // set up labels
        calendarView.visibleDates{ (visibleDates) in
            self.setupViewsOfCalendar(from: visibleDates)
        }
    }
    
    func handleCellSelected(view: JTAppleCell?, cellState: CellState){
        guard let validCell = view as? CustomCell else { return }
        if validCell.isSelected{
            validCell.selectedView.isHidden = false
        } else {
            validCell.selectedView.isHidden = true
        }
    }
    
    func handleCellTextColor(view: JTAppleCell?, cellState: CellState){
        guard let validCell = view as? CustomCell else { return }
        
        if cellState.isSelected{
            validCell.dateLabel.textColor = selectedMonthColor
        } else{
            if cellState.dateBelongsTo == .thisMonth{
                validCell.dateLabel.textColor = monthColor
            } else {
                validCell.dateLabel.textColor = outsideMonthColor
            }
        }
    }
    
    func setupViewsOfCalendar(from visibleDates: DateSegmentInfo){
        let date = visibleDates.monthDates.first!.date
        
        self.formatter.dateFormat = "yyyy"
        self.year.text = self.formatter.string(from: date)
        
        self.formatter.dateFormat = "MMMM"
        self.month.text = self.formatter.string(from: date)
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
