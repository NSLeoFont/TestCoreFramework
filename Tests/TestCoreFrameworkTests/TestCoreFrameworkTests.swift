import XCTest
@testable import TestCoreFramework

final class TestCoreFrameworkTests: XCTestCase {
   
    func testColorRedEqual() {
        let color = TestCoreFramework.colorFromHexString("FF0000")
        XCTAssertEqual(color, .red)
    }

    static var allTests = [
        ("testColorRedEqual", testColorRedEqual),
    ]
}
