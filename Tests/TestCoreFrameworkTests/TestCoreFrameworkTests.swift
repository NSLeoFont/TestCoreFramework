import XCTest
@testable import TestCoreFramework

final class TestCoreFrameworkTests: XCTestCase {
   
    func testColorRedEqual() {
        let color = TestCoreFramework.colorFromHexString("FF0000")
        XCTAssertEqual(color, .red)
    }
    
    func testCoreFrameworkColorsAreEqual() {
        let color = TestCoreFramework.colorFromHexString("006736")
        XCTAssertEqual(color, TestCoreFramework.frameworkColor)

    }

    static var allTests = [
        ("testColorRedEqual", testColorRedEqual),
        ("testCoreFrameworkColorsAreEqual", testCoreFrameworkColorsAreEqual),
    ]
    
}
