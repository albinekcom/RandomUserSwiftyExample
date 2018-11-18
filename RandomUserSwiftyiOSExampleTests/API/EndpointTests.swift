@testable import RandomUserSwiftyiOSExample
import XCTest

final class EndpointTests: XCTestCase {
    
    func testEndpointResults() {
        let results5Endpoint = Endpoint.results(5, apiVersion: 1.2)
        XCTAssertEqual("https://randomuser.me/api/1.2/?results=5&exc=location", results5Endpoint.url?.absoluteString)
        
        let results100Endpoint = Endpoint.results(100, apiVersion: 1.2)
        XCTAssertEqual("https://randomuser.me/api/1.2/?results=100&exc=location", results100Endpoint.url?.absoluteString)
    }
    
}
