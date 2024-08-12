//
//  LottoMachineTests.swift
//  LottoMachineTests
//
//  Created by 최주리 on 8/13/24.
//

import XCTest
@testable import UnitTestSample

final class LottoMachineTests: XCTestCase {
    var sut: LottoMachine!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = LottoMachine()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_isValidLottoNumbers_호출시_6개보다적은숫자입력했을때_False를반환하는지() {
        //given
        let input = [3,6,9]
        
        //when
        let result = sut.isValidLottoNumbers(of: input)
        
        //then
        XCTAssertFalse(result)
    }
    
    func test_isValidLottoNumbers_호출시_6개보다많은숫자입력했을때_False를반환하는지() {
        //given
        let input = [3,6,9,2,11,15,40]
        
        //when
        let result = sut.isValidLottoNumbers(of: input)
        
        //then
        XCTAssertFalse(result)
    }
    
    func test_isValidLottoNumbers_호출시_6개보다많은숫자입력하고_중복된숫자가있을때_False를반환하는지() {
        //given
        let input = [3,6,9,2,11,15,3]
        
        //when
        let result = sut.isValidLottoNumbers(of: input)
        
        //then
        XCTAssertFalse(result)
    }
    
    func test_isValidLottoNumbers_호출시_6개인데중복된숫자가있을때_False를반환하는지() {
        //given
        let input = [3,6,9,2,11,3]
        
        //when
        let result = sut.isValidLottoNumbers(of: input)
        
        //then
        XCTAssertFalse(result)
    }
    
    func test_isValidLottoNumbers_호출시_중복없이6개입력했을때_True를반환하는지() {
        //given
        let input = [3,6,9,2,11,15]
        
        //when
        let result = sut.isValidLottoNumbers(of: input)
        
        //then
        XCTAssertTrue(result)
    }
    
    func test_isValidLottoNumbers_호출시_중복없는6개수중에_1보다작은게있을때_False를반환하는지() {
        //given
        let input = [3,6,9,2,11,-1]
        
        //when
        let result = sut.isValidLottoNumbers(of: input)
        
        //then
        XCTAssertFalse(result)
    }
    
    func test_isValidLottoNumbers_호출시_중복없는6개수중에_45보다작은게있을때_False를반환하는지() {
        //given
        let input = [3,6,9,2,11,46]
        
        //when
        let result = sut.isValidLottoNumbers(of: input)
        
        //then
        XCTAssertFalse(result)
    }
    
    func test_isValidLottoNumbers_호출시_중복없는6개가_모두1부터45사이일때_True를반환하는지() {
        //given
        let input = [3,6,9,2,11,45]
        
        //when
        let result = sut.isValidLottoNumbers(of: input)
        
        //then
        XCTAssertTrue(result)
    }
    
    func test_makeRandomLottoNumbersArray_반환배열이유효한지() {
        //given
        let input = sut.makeRandomLottoNumbersArray()
        
        //when
        let result = sut.isValidLottoNumbers(of: input)
        
        //then
        XCTAssertTrue(result)
    }
    
    func test_countMatchingNumber_유효한지() throws {
        //given
        let userInput = sut.makeRandomLottoNumbersArray()
        let winnerInput = sut.makeRandomLottoNumbersArray()
        
        //when
        let result = try sut.countMatchingNumber(user: userInput, winner: winnerInput)
        
        //then
        print(result)
        XCTAssertGreaterThan(result, -1)
    }
}
