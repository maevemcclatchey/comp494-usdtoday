//
//  Event.swift
//  USDToday
//
//  Created by Maeve McClatchey on 5/3/18.
//  Copyright © 2018 University of San Diego. All rights reserved.
//

import Foundation

struct Event: Codable{
    var title: String
    var description: String
    var isInMyCalendar: Bool = false
    var date: [String: String]
    
    init(title: String, description: String, isInMyCalendar: Bool, date: [String: String]) {
        self.title = title
        self.description = description
        self.isInMyCalendar = isInMyCalendar
        self.date = date
    }
    
    public func getDummyData() -> [Event] {
        let events = [Event(title: "Movie Night", description:"Coco", isInMyCalendar: true, date:["May 05":"7:30 pm - 9 pm" ]), Event(title: "Engineering Showcase", description:"Presentations of senior projects completed by Engineering and Computer Science students", isInMyCalendar: true, date:["May 11":"2:30 pm - 5 pm" ])]
        
        return events
    }
}



