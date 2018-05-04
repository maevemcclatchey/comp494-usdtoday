//
//  UsdDayController.swift
//  
//
//  Created by Maeve McClatchey on 5/2/18.
//

import Foundation
import UIKit


class UsdDayController: ViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let events = [Event(title: "Movie Night", description:"Coco", isInMyCalendar: false, date:["May 05":"7:30 pm - 9 pm" ])]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "USDEventSegue"{
            let selectedEvent = segue.destination as! EventDetailController
            selectedEvent.title = "" // TODO: set title to selected event
        }
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EventCellIdentifier") as? EventCell else {
            fatalError("Could not dequeue a cell")
        }

        let event = events[indexPath.row]
        cell.title.text = event.title
        cell.detail.text = event.description
        
        return cell
    }
    
}
