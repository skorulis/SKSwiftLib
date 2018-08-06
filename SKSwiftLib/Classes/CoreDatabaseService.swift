//  Created by Alexander Skorulis on 24/12/17.
//  Copyright © 2017 Alex Skorulis. All rights reserved.

import CoreData

open class CoreDatabaseService: NSObject {

    // MARK: - Core Data stack
    
    let dbName:String
    
    public init(dbName:String) {
        self.dbName = dbName
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: dbName)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    public func mainContext() -> NSManagedObjectContext {
        return self.persistentContainer.viewContext
    }
    
}
