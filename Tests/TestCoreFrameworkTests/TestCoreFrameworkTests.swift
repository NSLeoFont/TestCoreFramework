import XCTest
@testable import TestCoreFramework

final class TestCoreFrameworkTests: XCTestCase {
   
    func testColorRedEqual() {
        let color = TestCoreFramework.colorFromHexString("FF0000")
        XCTAssertEqual(color, .red)
    }
    
    func testPrimaryFrameworkColorsAreEqual() {
        let color = TestCoreFramework.colorFromHexString("006736")
        XCTAssertEqual(color, TestCoreFramework.frameworkColor)

    }
    
    func testSecondaryFrameworkColorsAreEqual() {
        let color = TestCoreFramework.colorFromHexString("FCFFD")
        XCTAssertEqual(color, TestCoreFramework.secondaryFrameworkColor)
    }

    static var allTests = [
        ("testColorRedEqual", testColorRedEqual),
        ("testPrimaryFrameworkColorsAreEqual", testPrimaryFrameworkColorsAreEqual),
         ("testSecondaryFrameworkColorsAreEqual", testSecondaryFrameworkColorsAreEqual),
    ]
    
}
