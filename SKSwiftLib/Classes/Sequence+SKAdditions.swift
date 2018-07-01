//
//  Sequence+SKAdditions.swift
//  SKSwiftLib
//
//  Created by Alexander Skorulis on 31/12/17.
//

import UIKit

public extension Sequence {
    
    public func groupSingle<U: Hashable>(by key: (Iterator.Element) -> U) -> [U:Iterator.Element] {
        var categories: [U: Iterator.Element] = [:]
        for element in self {
            let key = key(element)
            assert(categories[key] == nil,"Duplicate entry")
            categories[key] = element
        }
        return categories
    }
    
    public func group<U: Hashable>(by key: (Iterator.Element) -> U) -> [U:[Iterator.Element]] {
        var categories: [U: [Iterator.Element]] = [:]
        for element in self {
            let key = key(element)
            if case nil = categories[key]?.append(element) {
                categories[key] = [element]
            }
        }
        return categories
    }
    
    //Split the array into 2, the first passing the test, the second failing
    public func split(by filter:(Iterator.Element) -> Bool) -> (passing:[Iterator.Element],failing:[Iterator.Element]) {
        let array1 = self.filter(filter)
        let array2 = self.filter { (e) -> Bool in
            return !filter(e)
        }
        return (array1,array2)
        
    }

}

