@testable import RandomUserSwiftyiOSExample
import XCTest

final class EndpointTests: XCTestCase {
    
    func testEndpointResults() {
        let results5 = Endpoint.results(5)
        XCTAssertEqual("https://randomuser.me/api/?results=5", results5.url?.absoluteString)
        
        let results100 = Endpoint.results(100)
        XCTAssertEqual("https://randomuser.me/api/?results=100", results100.url?.absoluteString)
    }

}
