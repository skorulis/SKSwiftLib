//
//  NSManagedObjectContext+SKAdditions.swift
//  SKSwiftLib
//
//  Created by Alexander Skorulis on 31/12/17.
//

import UIKit
import CoreData

public extension NSManagedObjectContext {

    public func childContext() -> NSManagedObjectContext {
        let childContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        childContext.parent = self
        return childContext
    }
    
    public func saveRecursively(completion:((Error?) -> ())? ) {
        do {
            try self.save()
            if let p = self.parent {
                p.saveRecursively(completion: completion)
            } else {
                completion?(nil)
            }
        } catch  {
            completion?(error)
        }
        
    }
    
}

