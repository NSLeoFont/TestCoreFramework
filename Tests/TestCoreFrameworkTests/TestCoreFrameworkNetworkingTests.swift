//
//  TestCoreFrameworkNetworkingTests.swift
//  TestCoreFrameworkTests
//
//  Created by Leo Font on 24/08/2020.
//

import XCTest
@testable import TestCoreFramework

final class TestCoreFrameworkNetworkingTests: XCTestCase {
    
    func testLoadDataCall() {
        let manager = TestCoreFramework.Networking.Manager()
        let expectation = XCTestExpectation(description: "Called for data")
        
        guard let url = URL(string: "https://www.leofont.eu") else {
            return XCTFail("Could not create URL properly")
        }
        
        manager.loadData(from: url) { result in
            expectation.fulfill()
            
            switch result {
            case .success(let returnedData):
                XCTAssertNil(returnedData, "Returned data is nil")
            case .failure(let error):
                XCTFail(error?.localizedDescription ?? "There was an error forming error result")
            }
        }
        wait(for: [expectation], timeout: 5)
        
        
    }

    static var allTests = [
        ("testLoadDataCall", testLoadDataCall)
        
    ]
    
}
