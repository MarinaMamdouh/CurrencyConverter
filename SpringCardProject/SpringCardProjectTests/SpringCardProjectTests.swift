//
//  SpringCardProjectTests.swift
//  SpringCardProjectTests
//
//  Created by Marina on 03/03/2022.
//

import XCTest
import SpringCardProject

class SpringCardProjectTests: XCTestCase {
    
    func testDoubleDescriptionExtension(){
        // test long decimals up to 6
        // expect number in string without rounding
        var d = 0.000025
        var result = d.toString
        XCTAssertEqual(result, "0.000025")
        
        // test whole number in decimal form
        // expect remove 0 and .
        d = 1.0
        result = d.toString
        XCTAssertEqual(result, "1")
        
        // test number with two many 0's in the end
        // expect to remove last 0's
        d = 2.10000
        result = d.toString
        XCTAssertEqual(result, "2.1")
        
        
    }
    
    
    func testNumberToMoneyFormat(){
        // test thousands numbers with decimal
        // expect number like :1,000.1
        var d = 3569.1
        var result = d.toMoney
        XCTAssertEqual(result, "3,569.1")
        
        // test ten thousands numbers
        // expect number e.g 10,000
        d = 30234
        result = d.toMoney
        XCTAssertEqual(result, "30,234")
        
        // test millions numbers
        // expect number e.g 1,000,000
        d = 1234567
        result = d.toMoney
        XCTAssertEqual(result, "1,234,567")
        
        
        
    }

}
