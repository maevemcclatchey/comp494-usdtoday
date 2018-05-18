//
//  Event.swift
//  USDToday
//
//  Created by Maeve McClatchey on 5/3/18.
//  Copyright © 2018 University of San Diego. All rights reserved.
//

import Foundation

struct Event: Codable, Equatable{
    var title: String
    var description: String
    var isInMyCalendar: Bool = false
    var date: String
    var eventType: String
    
    
    
    init(title: String, description: String, isInMyCalendar: Bool, date: String, eventType: String) {
        self.title = title
        self.description = description
        self.isInMyCalendar = isInMyCalendar
        self.date = date
        self.eventType = eventType
    }
    
    public static func ==(lhs: Event, rhs: Event) -> Bool {
        return lhs.title == rhs.title
    }
    
    public func getDummyData() -> [Event] {
        let events = [Event(title: "Movie Night", description:"Coco", isInMyCalendar: true, date:"May 05 7:30 pm - 9 pm", eventType: "Greek Life"), Event(title: "Engineering Showcase", description:"Presentations of senior projects completed by Engineering and Computer Science students", isInMyCalendar: true, date:"May 11 2:30 pm - 5 pm", eventType: "Academics"), Event(title: "CS Showcase", description: "Senior Project Presentations", isInMyCalendar: true, date:"May 11 2:30pm - 5:30pm", eventType: "Academic")]
        
        return events
    }
    
    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let archiveURL = documentsDirectory.appendingPathComponent("event_test").appendingPathExtension("plist")
    
    static func saveToFile(_ events: [Event]){
        let propertyListEncoder = PropertyListEncoder()
        let encodedEvent = try? propertyListEncoder.encode(events)
        
        try? encodedEvent?.write(to: archiveURL, options: .noFileProtection)
    }
    
    static func loadFromFile()-> [Event]{
        let propertyListDecoder = PropertyListDecoder()
        if let retrievedEventData = try? Data(contentsOf: archiveURL),
            let decodedEvent = try? propertyListDecoder.decode(Array<Event>.self, from: retrievedEventData){
            return decodedEvent
        }
        return []
    }
}







