//
//  TestCoreFrameworkNetworkingTests.swift
//  TestCoreFrameworkTests
//
//  Created by Leo Font on 24/08/2020.
//

import XCTest
@testable import TestCoreFramework

class NetworkSessionMock: NetworkSession {
    
    var data: Data?
    var error: Error?
    
    func get(from url: URL, completionHandler: @escaping (Data?, Error?) -> Void) {
        completionHandler(data, error)
    }
    
    
    
}

final class TestCoreFrameworkNetworkingTests: XCTestCase {
    
    func testLoadDataCall() {
        let manager = TestCoreFramework.Networking.Manager()
        let session = NetworkSessionMock()
        manager.session = session
        
        
        let expectation = XCTestExpectation(description: "Called for data")
        
//        guard let url = URL(string: "https://www.leofont.eu") else {
//            return XCTFail("Could not create URL properly")
//        }
        
        let data = Data([0, 1, 0, 1])
        session.data = data
        let url = URL(fileURLWithPath: "url")
        
        
        manager.loadData(from: url) { result in
            expectation.fulfill()
            
            switch result {
            case .success(let returnedData):
                XCTAssertEqual(data, returnedData, "Manager returned unexpected data")
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
