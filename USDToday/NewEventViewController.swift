//
//  NewEventViewController.swift
//  USDToday
//
//  Created by Maeve McClatchey on 5/7/18.
//  Copyright © 2018 University of San Diego. All rights reserved.
//

import Foundation
import UIKit
import JTAppleCalendar


class NewEventViewController: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let eventTypes = ["Campus Event","Meeting", "Presentation/Talk", "Greek Life","Other"]
    
    @IBOutlet weak var eventTypePicker: UIPickerView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    var selectedEventType: String = ""
    var selectedDate: String = ""
    
    let formatter = DateFormatter()
   
    @IBOutlet weak var saveButton: UIButton!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return eventTypes.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return eventTypes[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == datePicker {
            datePicker.date = Date().addingTimeInterval(24*60*60)
            selectedDate = formatter.string(from: datePicker.date)
            
            //formatter.dateFormat = "yyyy MM dd"
            //selectedDate = formatter.date(from: selectedDate)
            
        }
        else if pickerView == eventPickerView {
            selectedEventType = eventTypes[row]
        }
    }
    

    @IBOutlet weak var eventPickerView: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        eventPickerView.dataSource = self
        eventPickerView.delegate = self
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 5
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    @IBAction func saveButtonPressed(){
        let newEvent = Event(title: titleTextField.text!, description: descriptionTextField.text!, isInMyCalendar: true, date: selectedDate, eventType: selectedEventType)
        if EventsSingleton.shared.eventsList.contains(newEvent) {
            EventsSingleton.shared.update(event: newEvent, isInMyCalendar: false)
        } else {
            EventsSingleton.shared.update(event: newEvent, isInMyCalendar: false)
        }
        
    }
    
    /*
    @IBAction func unwindToEventTableView(segue: UIStoryboard){
        guard segue.identifier == "saveUnwind" else { return }
        let sourceViewController = segue.source as! AddEditEventTableViewController
        
        if let event = sourceViewController.event{
            if let selectedIndexPath = tableView.indexPathForSelectedRow{
                events[selectedIndexPath] = event
                tableView
            }
        }
        
    }
 
    */
    
    
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
