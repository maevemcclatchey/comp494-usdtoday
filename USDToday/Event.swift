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
    
    
    /*
    // store and retrieve items from disk
    static func loadEvents() -> [Event]? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Event.ArchiveURL.path) as? [Event]
    }
    
    static func saveEvents(_ events: [Event]) {
        NSKeyedArchiver.archiveRootObject(events, toFile: Event.ArchiveURL.path)
    }
    
    struct PropertyKey {
        static let title = "title"
        static let isInMyCalendar = "isInMyCalendar"
        static let date = "date"
        static let eventType = "eventType"
        static let description = "description"
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        guard let title = aDecoder.decodeObject(forKey: PropertyKey.title) as? String,
            let date = aDecoder.decodeObject(forKey: PropertyKey.date) as? String else {
                return nil
        }
        
        let isInMyCalendar = aDecoder.decodeBool(forKey: PropertyKey.isInMyCalendar)
        let description = aDecoder.decodeObject(forKey: PropertyKey.description) as? String
        let eventType = aDecoder.decodeObject(forKey: PropertyKey.eventType) as? String

        self.init(title: title, description: description!, isInMyCalendar: isInMyCalendar, date: date, eventType: eventType!)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(title, forKey: PropertyKey.title)
        aCoder.encode(isInMyCalendar, forKey: PropertyKey.isInMyCalendar)
        aCoder.encode(date, forKey: PropertyKey.date)
        aCoder.encode(eventType, forKey: PropertyKey.eventType)
        aCoder.encode(description, forKey: PropertyKey.description)
    }
    */
}







