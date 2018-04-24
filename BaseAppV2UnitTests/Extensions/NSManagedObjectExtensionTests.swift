//
//  NSManagedObjectExtensionTests.swift
//  BaseAppV2
//
//  Created by Emanuel  Guerrero on 3/7/17.
//  Copyright © 2017 SilverLogic. All rights reserved.
//

@testable import BaseAppV2
import CoreData
import XCTest

final class NSManagedObjectExtensionTests: BaseAppV2UnitTests {
    
    // MARK: - Functional Tests
    func testEntityName() {
        XCTAssertEqual(NSManagedObject.entityName, "NSManagedObject", "Incorrect Format!")
        XCTAssertEqual(User.entityName, "User", "Incorrect Format!")
    }
}
