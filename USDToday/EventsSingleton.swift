//
//  EventsSingleton.swift
//  USDToday
//
//  Created by Maeve McClatchey on 5/16/18.
//  Copyright © 2018 University of San Diego. All rights reserved.
//

import Foundation

public class EventsSingleton: Codable {
    static let shared = EventsSingleton()
    
    
   // var eventsList: [Event] = []
    
    private let documentsDirectory: URL
    private let archiveURL: URL
    
    init() {
        documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        archiveURL = documentsDirectory.appendingPathComponent("events").appendingPathExtension(".plist")
    }
    
    func update(event: Event, isInMyCalendar: Bool){
        let eventsFromDisk = loadFromFile()
        
        if let eventsFromDisk = eventsFromDisk {
            if isInMyCalendar {
                if eventsFromDisk.contains(event) {
                    saveToFile()
                } else {
                    eventsList.append(event)
                    saveToFile()
                }
            } else {
                //eventsList.remove(at: eventsList.index(of: event)!)
                eventsList.append(event)
                saveToFile()
            }
        } else {
            eventsList.append(event)
            
            saveToFile()
        }
    }
    
    
    private func saveToFile() {
        let encoder = PropertyListEncoder()
        let encodedPlaces = try! encoder.encode(eventsList)
        try! encodedPlaces.write(to: archiveURL, options: .noFileProtection)
    }
    
    private func loadFromFile() -> [Event]? {
        guard let decodedList = try? Data(contentsOf: archiveURL) else { return nil }
        
        let decoder = PropertyListDecoder()
        do {
            let decodedArray = try decoder.decode(Array<Event>.self, from: decodedList)
            return decodedArray
        } catch { return nil }
    }
    
    func loadEvents() {
        if let eventsFromDisk = loadFromFile() {
            EventsSingleton.shared.eventsList = eventsFromDisk
        }
    }
}
