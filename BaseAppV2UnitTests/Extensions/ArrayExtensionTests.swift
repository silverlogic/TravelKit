//
//  ArrayExtensionTests.swift
//  BaseAppV2
//
//  Created by Emanuel  Guerrero on 3/22/17.
//  Copyright © 2017 SilverLogic. All rights reserved.
//

@testable import BaseAppV2
import XCTest

final class ArrayExtensionTests: BaseAppV2UnitTests {
    
    // MARK: - Functional Tests
    func testStringWithSeparator() {
        let numberArray = [1, 2, 3, 4, 5, 6, 7, 8, 9]
        let string = numberArray.stringWithSeparator(",")
        XCTAssertEqual(string, "1,2,3,4,5,6,7,8,9", "Incorrect String Format!")
    }
}
