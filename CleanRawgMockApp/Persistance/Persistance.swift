//
//  Persistance.swift
//  CleanRawgMockApp
//
//  Created by Farhandika Zahrir Mufti guenia on 30/08/21.
//

//import Foundation
import CoreData
 
class PersistentContainer: NSPersistentContainer {
    func saveContext(backgroundContext: NSManagedObjectContext? = nil) {
        let context = backgroundContext ?? viewContext
        guard context.hasChanges else { return }
        do {
            try context.save()
        } catch let error as NSError {
            print("Error: \(error), \(error.userInfo)")
        }
    }
}








































struct PersistenceController1 {
    // A singleton for our entire app to use
    static let shared = PersistenceController1()

    // Storage for Core Data
    let container: NSPersistentContainer


    // An initializer to load Core Data, optionally able
    // to use an in-memory store.
    init(inMemory: Bool = false) {
        // If you didn't name your model Main you'll need
        // to change this name below.
        container = NSPersistentContainer(name: "myFav")

        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }

        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func save() {
        let context = container.viewContext

        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("ERROR: \(error.localizedDescription)")
            }
        }
    }
}
