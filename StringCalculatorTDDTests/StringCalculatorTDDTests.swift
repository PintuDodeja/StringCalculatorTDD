//
//  StringCalculatorTDDTests.swift
//  StringCalculatorTDDTests
//
//  Created by Pintu Dodeja on 04/07/25.
//

import XCTest
@testable import StringCalculatorTDD

final class StringCalculatorTDDTests: XCTestCase {
    
    var calculator: StringCalculator!
    
    override func setUp() {
        super.setUp()
        calculator = StringCalculator()
    }
    
    func testEmptyStringReturnsZero() throws {
        XCTAssertEqual(try calculator.add(""), 0)
    }
    
    func testSingleNumberReturnsValue() throws {
        XCTAssertEqual(try calculator.add("1"), 1)
    }
    
    func testTwoNumbersCommaDelimitedReturnsSum() throws {
        XCTAssertEqual(try calculator.add("1,2"), 3)
    }
    
    func testMultipleNumbersCommaDelimitedReturnsSum() throws {
        XCTAssertEqual(try calculator.add("1,2,3,4,5"), 15)
    }
    
    func testNumbersWithNewlineAndComma() throws {
        XCTAssertEqual(try calculator.add("1\n2,3"), 6)
    }
    
    func testCustomDelimiterSemicolon() throws {
        XCTAssertEqual(try calculator.add("//;\n1;2"), 3)
    }
    
    func testCustomDelimiterPipe() throws {
        XCTAssertEqual(try calculator.add("//|\n1|2|3"), 6)
    }
    
    func testNegativeNumberThrowsError() {
        XCTAssertThrowsError(try calculator.add("-1")) { error in
            guard let error = error as? StringCalculatorError else { return XCTFail() }
            XCTAssertEqual(error.localizedDescription, "\(StringConstant.negativeNumberErrorMessage): -1")
        }
    }
    
    func testMultipleNegativeNumbersThrowAll() {
        XCTAssertThrowsError(try calculator.add("2,-4,3,-5")) { error in
            guard let error = error as? StringCalculatorError else { return XCTFail() }
            XCTAssertEqual(error.localizedDescription, "\(StringConstant.negativeNumberErrorMessage): -4,-5")
        }
    }
    
}
