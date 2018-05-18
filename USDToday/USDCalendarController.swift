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
    
    let formatter = DateFormatter()
    @IBOutlet weak var calendarView: JTAppleCalendarView!
    
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var month: UILabel!

    // dark blue #123b7c  #003B6F
    // light blue #0074C8
    let outsideMonthColor = UIColor.gray
    let monthColor = UIColor.black
    let selectedMonthColor = UIColor.black
    let currentDateSelectedViewColor = UIColor.blue
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCalendarView()
    }
    
    @IBAction func allEventsButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "MasterSegue", sender: self)
    }
    
    func setUpCalendarView(){
        // set up calendar spacing
        calendarView.minimumLineSpacing = 0
        calendarView.minimumInteritemSpacing = 0
        
        // set up labels
        calendarView.visibleDates{ (visibleDates) in
            self.setupViewsOfCalendar(from: visibleDates)
            print("set up calendar view\n")
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
    
    func handleCellTextColor(view: JTAppleCell?, cellState: CellState) {
        guard let validCell = view as? CustomCell else { return }
        if cellState.isSelected {
            validCell.dateLabel.textColor = selectedMonthColor
        } else {
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
    
    func configureCell(view: JTAppleCell?, cellState: CellState) {
        guard let myCustomCell = view as? CustomCell  else { return }
        myCustomCell.dateLabel.text = cellState.text
        handleCellTextColor(view: myCustomCell, cellState: cellState)
        handleCellSelected(view: myCustomCell, cellState: cellState)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "usdSegue"{
            let selectedDay = segue.destination as! UsdDayController
            selectedDay.navigationItem.title = daySelected
        }
        if segue.identifier == "addNewEvent"{
            let dest = segue.destination as! NewEventViewController
            dest.navigationItem.title = "New Event"
        }
        //if segue.identifier == "MasterSegue" {
         //   let destination = segue.destination as! MasterTableViewController
        //}
    }
}

// JTAppleCalendar stuff
extension USDCalendarController: JTAppleCalendarViewDataSource {
    func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        let customCell = cell as! CustomCell
        configureCell(view: customCell, cellState: cellState)
        
    }
    
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters{
        formatter.dateFormat = "yyyy MM dd"
        formatter.timeZone = Calendar.current.timeZone
        formatter.locale = Calendar.current.locale
        
        let startDate = formatter.date(from: "2018 01 01")!
        let endDate = formatter.date(from: "2019 01 01")!
        
        let parameters = ConfigurationParameters(startDate: startDate, endDate: endDate)
        print("configured calendar\n")
        return parameters
    }
    
}
extension USDCalendarController: JTAppleCalendarViewDelegate {
    // Display the cell
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
        configureCell(view: cell, cellState: cellState)
        
        return cell
    }
    
    // select method
    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState){
        configureCell(view: cell, cellState: cellState)
    }
    
    // deselect method
    func calendar(_ calendar: JTAppleCalendarView, didDeselectDate date: Date, cell: JTAppleCell?, cellState: CellState){
        configureCell(view: cell, cellState: cellState)
    }
 
    func calendar(_ calendar: JTAppleCalendarView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo){
        setupViewsOfCalendar(from: visibleDates)
    }
 
}
/*
extension UIColor{
    convenience init(colorWithHexValue value: Int, alpha: CGFloat = 1.0){
        self.init(
            darkBlue: CGFloat((value & 0x003B6F) >> 16) / 255.0,
            lightBlue: CGFloat((value & 0x0074C8) >> 16) / 255.0,
            alpha: alpha
        )
    }
    
}
 */

