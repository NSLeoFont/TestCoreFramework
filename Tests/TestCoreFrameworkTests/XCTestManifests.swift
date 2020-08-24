import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(TestCoreColorFrameworkTests.allTests),
        testCase(TestCoreFrameworkNetworkingTests.allTests),

    ]
}
#endif
