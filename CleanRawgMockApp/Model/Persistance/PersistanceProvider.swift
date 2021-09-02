//
//  PersistanceProvider.swift
//  CleanRawgMockApp
//
//  Created by Farhandika Zahrir Mufti guenia on 01/09/21.
//

import CoreData
import Foundation
import SwiftUI

class PersistanceProvider {
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "myFav")

        container.loadPersistentStores { _, error in
            guard error == nil else {
                fatalError("Unresolved error \(error!)")
            }
        }
        container.viewContext.automaticallyMergesChangesFromParent = false
        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        container.viewContext.shouldDeleteInaccessibleFaults = true
        container.viewContext.undoManager = nil

        return container
    }()
    
    private func newTaskContext() -> NSManagedObjectContext {
        let taskContext = persistentContainer.newBackgroundContext()
        taskContext.undoManager = nil

        taskContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        return taskContext
    }
    
    func getAllFav(completion: @escaping(_ items: [ItemPreviewModel]) -> Void) {
        let taskContext = newTaskContext()
        taskContext.perform {
            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Favourite")
            do {
                let results = try taskContext.fetch(fetchRequest)
                var items:[ItemPreviewModel] = []
                for result in results {
                    let item = ItemPreviewModel(id: result.value(forKey: "id") as? Int,
                                                  slug: result.value(forKey: "slug") as? String,
                                                  name: result.value(forKey: "name") as? String,
                                                  image: result.value(forKey: "image")as? String,
                                                  released: result.value(forKey: "released") as? String,
                                                  desc: result.value(forKey: "desc") as? String,
                                                  rating: result.value(forKey: "rating") as? Float,
                                                  rank: result.value(forKey: "rank") as? Int
                    )
                    items.append(item)
                }
                completion(items)
            } catch let error as NSError {
                print("Could not fetch. \(error), \(error.userInfo)")
            }
        }
    }
}


extension PersistanceProvider {
    
    func createNewFav(
        id:Int!,
        slug:String!,
        name:String!,
        image:String!,
        released:String!,
        desc:String!,
        rating:Float!,
        completion: @escaping() -> Void
    ){
       /* checkId(id) { res in
            if res == false {
                print("Sending Alert button")
                return
            }
        }*/
        
        let taskContext = newTaskContext()

        taskContext.performAndWait {
            if let entity = NSEntityDescription.entity(forEntityName: "Favourite", in: taskContext) {
                let item = NSManagedObject(entity: entity, insertInto: taskContext)
                item.setValue(id, forKey: "id")
                item.setValue(slug, forKey: "slug")
                item.setValue(name, forKey: "name")
                item.setValue(image, forKey: "image")
                item.setValue(released, forKey: "released")
                item.setValue(desc, forKey: "desc")
                item.setValue(rating, forKey: "rating")
                do{
                    try taskContext.save()
                    completion()
                } catch let error as NSError {
                    print("Could not save. \(error), \(error.userInfo)")
                }
            }
        }
    }
    
    func deleteItem(_ id: Int, completion: @escaping() -> Void) {
        let taskContext = newTaskContext()
        taskContext.perform {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Favourite")
            fetchRequest.fetchLimit = 1
            fetchRequest.predicate = NSPredicate(format: "id == \(id)")
            let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
            batchDeleteRequest.resultType = .resultTypeCount
            if let batchDeleteResult = try? taskContext.execute(batchDeleteRequest) as? NSBatchDeleteResult {
                if batchDeleteResult.result != nil {
                    completion()
                }
            }
        }
    }
    
    private func checkId(_ id:Int?,completion: @escaping(_ res:Bool) -> Void) {
        let taskContext = newTaskContext()
        taskContext.perform {
            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Favourite")
            fetchRequest.fetchLimit = 1
            fetchRequest.predicate = NSPredicate(format: "id == \(String(describing: id))")
            do {
                if let result = try taskContext.fetch(fetchRequest).first {
                    completion(result.value(forKey: "id") as? Int == id) // harusnya ada yg lebih baik, kudu bljr lebih dalem lagi
                }
            }catch let error as NSError {
                print("Could not fetch. \(error), \(error.userInfo)")
               //return false
            }
        }
    }
    
    func addMemberDummy(completion: @escaping() -> Void) {
        for item in dumdum {
            self.createNewFav(id: item.id, slug: item.slug, name: item.name, image: item.image, released: item.released, desc: item.desc, rating: item.rating){
                completion()
            }
        }
    }
    
    func getMember(_ id: Int, completion: @escaping(_ members: ItemPreviewModel) -> Void) {
        let taskContext = newTaskContext()
        taskContext.perform {
            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Favourite")
            fetchRequest.fetchLimit = 1
            fetchRequest.predicate = NSPredicate(format: "id == \(id)")
            do {
                if let result = try taskContext.fetch(fetchRequest).first {
                    let item = ItemPreviewModel(id: result.value(forKey: "id") as? Int,
                                         slug: result.value(forKey: "slug") as? String,
                                         name: result.value(forKey: "name") as? String,
                                         image: result.value(forKey: "image")as? String,
                                         released: result.value(forKey: "released") as? String,
                                         desc: result.value(forKey: "desc") as? String,
                                         rating: result.value(forKey: "rating") as? Float,
                                         rank: result.value(forKey: "rank") as? Int
                        )
                    completion(item)
                }
            } catch let error as NSError {
                print("Could not fetch. \(error), \(error.userInfo)")
            }
        }
    }
    
    func deleteAll(completion: @escaping() -> Void) {
        let taskContext = newTaskContext()
        taskContext.perform {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Favourite")
            let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
            batchDeleteRequest.resultType = .resultTypeCount
            if let batchDeleteResult = try? taskContext.execute(batchDeleteRequest) as? NSBatchDeleteResult {
                if batchDeleteResult.result != nil {
                    completion()
                }
            }
        }
    }
    
}
