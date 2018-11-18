@testable import RandomUserSwiftyiOSExample
import XCTest

final class APIResponseParserTests: XCTestCase {
    
    private let apiResponseParser = APIResponseParser()
    
    func testParseResponse() throws {
        let bundle = Bundle(for: type(of: self))
        
        guard let url = bundle.url(forResource: "response_mock", withExtension: "json") else {
            XCTFail("Missing file: response_mock.json")
            return
        }
        
        let jsonData = try Data(contentsOf: url)
        
        let response = try APIResponseParser().parseResponse(data: jsonData)
        
        XCTAssertEqual(5, response.results?.count)
    }
    
}
