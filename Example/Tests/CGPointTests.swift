//
//  CGPointTests.swift
//  SKSwiftLib_Tests
//
//  Created by Alexander Skorulis on 4/8/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest
import SKSwiftLib

class CGPointTests: XCTestCase {
    
    func testLength() {
        let point = CGPoint(x: 1, y: 0)
        XCTAssertEqual(point.length(), 1)
        
        let point2 = CGPoint(x: 0, y: 0)
        XCTAssertEqual(point2.length(), 0)
    }
    
    
}
