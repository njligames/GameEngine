//
//  NJLIGameEngineTests.swift
//  NJLIGameEngineTests
//
//  Created by James Folk on 9/5/16.
//  Copyright © 2016 NJLIGames Ltd. All rights reserved.
//

import UIKit
import XCTest
@testable import NJLIGameEngine

class NJLIGameEngineTests: XCTestCase {
    var view: GLKView?
    let njliGameEngine: NJLIGameEngineObjC = NJLIGameEngineObjC()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        let viewController: UIViewController = UIApplication.sharedApplication().windows[0].rootViewController!
        
        view = viewController.view as? GLKView
        
//        njliGameEngine.create(view)
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
