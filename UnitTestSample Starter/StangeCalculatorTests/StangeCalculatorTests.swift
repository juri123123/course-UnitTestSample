//
//  StangeCalculatorTests.swift
//  StangeCalculatorTests
//
//  Created by 최주리 on 8/12/24.
//

import XCTest
@testable import UnitTestSample

final class StangeCalculatorTests: XCTestCase {
    var sut: StrangeCalculator!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = StrangeCalculator()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_addNumbers_호출시_3_7_23을전달했을때_33을반환하는지() {
        //given
        let input: [Int] = [-11, 1]
        
        //when
        let result = sut.addNumbers(of: input)
        
        //then
        print(result)
        XCTAssertEqual(result, -10)
    }
}
