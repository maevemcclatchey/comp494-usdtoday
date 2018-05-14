//
//  MyDayController.swift
//  
//
//  Created by Maeve McClatchey on 5/2/18.
//

import Foundation
import UIKit

class MyDayController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let events = [Event(title: "Movie Night", description:"Coco", isInMyCalendar: true, date:"May 05 7:30 pm - 9 pm", eventType: "Greek Life")]
    
    //let events = [Event]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "MyEventSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MyEventSegue"{
            let selectedEvent = segue.destination as! EventDetailController
            selectedEvent.navigationItem.title = "" //TODO: set title to selected cell title
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
        cell.title?.text? = event.title
        cell.detail?.text? = event.description
       
        return cell
    }
      func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
