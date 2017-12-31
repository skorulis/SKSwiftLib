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

}

