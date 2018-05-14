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

// JTAppleCalendar stuff
extension ViewController: JTAppleCalendarViewDataSource, JTAppleCalendarViewDelegate {
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters{
        formatter.dateFormat = "yyyy MM dd"
        formatter.timeZone = Calendar.current.timeZone
        formatter.locale = Calendar.current.locale
        
        let startDate = formatter.date(from: "2018 01 01")!
        let endDate = formatter.date(from: "2019 01 01")!
        
        let parameters = ConfigurationParameters(startDate: startDate, endDate: endDate)
        return parameters
    }
    
    func configureCell(view: JTAppleCell?, cellState: CellState) {
        guard let myCustomCell = view as? CustomCell  else { return }
        handleCellTextColor(view: myCustomCell, cellState: cellState)
        handleCellSelected(view: myCustomCell, cellState: cellState)
    }
    
    
    func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        configureCell(view: cell, cellState: cellState)
    }
    
    
    // Display the cell
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
        
        cell.dateLabel.text = cellState.text
        handleCellSelected(view: cell, cellState: cellState)
        handleCellTextColor(view: cell, cellState: cellState)
        
        return cell
    }
    
    // select method
    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState){
        handleCellSelected(view: cell, cellState: cellState)
        handleCellTextColor(view: cell, cellState: cellState)
    }
    
    // deselect method
    func calendar(_ calendar: JTAppleCalendarView, didDeselectDate date: Date, cell: JTAppleCell?, cellState: CellState){
        handleCellSelected(view: cell, cellState: cellState)
        handleCellTextColor(view: cell, cellState: cellState)
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo){
        setupViewsOfCalendar(from: visibleDates)
    }
}

