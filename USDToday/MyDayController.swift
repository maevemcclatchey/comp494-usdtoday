//
//  MyDayController.swift
//  
//
//  Created by Maeve McClatchey on 5/2/18.
//

import Foundation
import UIKit

class MyDayController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MyEventSegue"{
            let selectedEvent = segue.destination as! EventDetailController
            selectedEvent.title = "" // TODO: set title to selected day
            
        }
    }
}
