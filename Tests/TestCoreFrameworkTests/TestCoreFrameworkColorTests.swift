import XCTest
@testable import TestCoreFramework

final class TestCoreColorFrameworkTests: XCTestCase {
   
    func testColorRedEqual() {
        let color = TestCoreFramework.Color.fromHexString("FF0000")
        XCTAssertEqual(color, .red)
    }
    
    func testPrimaryFrameworkColorsAreEqual() {
        let color = TestCoreFramework.Color.fromHexString("006736")
        XCTAssertEqual(color, TestCoreFramework.Color.frameworkColor)

    }
    
    func testSecondaryFrameworkColorsAreEqual() {
        let color = TestCoreFramework.Color.fromHexString("FCFFD")
        XCTAssertEqual(color, TestCoreFramework.Color.secondaryFrameworkColor)
    }

    static var allTests = [
        ("testColorRedEqual", testColorRedEqual),
        ("testPrimaryFrameworkColorsAreEqual", testPrimaryFrameworkColorsAreEqual),
         ("testSecondaryFrameworkColorsAreEqual", testSecondaryFrameworkColorsAreEqual),
    ]
    
}
