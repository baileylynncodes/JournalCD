//
//  EntryController.swift
//  JournalCD
//
//  Created by Karissa McDaris on 12/6/18.
//  Copyright © 2018 trevorAdcock. All rights reserved.
//

import Foundation
import CoreData

class EntryController {
    
    static let sharedInstance = EntryController()
    private init(){}
    
    func addEntryWith(title: String, body: String){
        Entry(title: title, body: body)
        saveToPersistanceStore()
    }
    
    func update(entry: Entry, newTitle: String, newBody: String){
        entry.title = newTitle
        entry.body = newBody
        saveToPersistanceStore()
    }
    
    func delete(entry: Entry){
        //works, but is not safe
        //CoreDataStack.context.delete(entry)
        
        //better for multiple moc
        entry.managedObjectContext?.delete(entry)
        saveToPersistanceStore()
    }
    
    func saveToPersistanceStore() {
        do {
            try CoreDataStack.context.save()
        } catch {
            print("\(error) \(#function)")
        }
    }
}
