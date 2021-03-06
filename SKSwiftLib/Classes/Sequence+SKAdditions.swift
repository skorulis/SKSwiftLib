//
//  Sequence+SKAdditions.swift
//  SKSwiftLib
//
//  Created by Alexander Skorulis on 31/12/17.
//

import Foundation

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
    public func splitArray(by filter:(Iterator.Element) -> Bool) -> (passing:[Iterator.Element],failing:[Iterator.Element]) {
        let array1 = self.filter(filter)
        let array2 = self.filter { (e) -> Bool in
            return !filter(e)
        }
        return (array1,array2)
    }
    

}

public extension Array {
    
    //Temporary until swift 4.2 introduces a better version
    public func randomItem() -> Element? {
        if self.count == 0 {
            return nil
        }
        let index = arc4random_uniform(UInt32(self.count))
        return self[Int(index)]
    }
    
    
}

public extension Array where Element: Equatable {
    
    public func next(current:Element) -> Element {
        let index = self.index(of: current)!
        if index >= self.count - 1 {
            return self[0]
        }
        return self[index+1]
    }
    
    public func prev(current:Element) -> Element {
        let index = self.index(of: current)!
        if index == 0 {
            return self[self.count - 1]
        }
        return self[index-1]
    }
    
}
