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
    
    func post(with request: URLRequest, completionHandler: @escaping (Data?, Error?) -> Void) {
        completionHandler(data, error)
    }
}

struct MockData: Equatable, Codable {
    var id: Int
    var name: String
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
    
    func testSendDataCall() {
        
        let manager = TestCoreFramework.Networking.Manager()
        let session = NetworkSessionMock()
        manager.session = session
        
        let sampleObject = MockData(id: 1, name: "Leo")
        
        let data = try? JSONEncoder().encode(sampleObject)
        session.data = data
        
        let url = URL(fileURLWithPath: "url")
        
        let expectation = XCTestExpectation(description: "Called to send data")
        
        manager.sendData(to: url, body: sampleObject) { result in
            expectation.fulfill()
            switch result {
            case .success(let returnedData):
                let returnedObject = try? JSONDecoder().decode(MockData.self, from: returnedData)
                XCTAssertEqual(returnedObject, sampleObject)
                break
            case .failure(let error):
                XCTFail(error?.localizedDescription ?? "Error forming error result")
                
                
            }
        }
        
        
        wait(for: [expectation], timeout: 5)
    }

    static var allTests = [
        ("testLoadDataCall", testLoadDataCall),
        ("testSendDataCall", testSendDataCall)
    ]
    
}
