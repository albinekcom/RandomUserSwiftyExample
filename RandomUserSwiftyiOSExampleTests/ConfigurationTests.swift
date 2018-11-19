@testable import RandomUserSwiftyiOSExample
import XCTest

final class ConfigurationTests: XCTestCase {
    
    func testAPIVersion() {
        XCTAssertEqual(1.2, Configuration.apiVersion)
    }
    
    func testResultsCount() {
        XCTAssertEqual(100, Configuration.resultsCount)
    }
    
}
