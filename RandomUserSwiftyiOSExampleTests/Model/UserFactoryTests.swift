@testable import RandomUserSwiftyiOSExample
import XCTest

final class UserFactoryTests: XCTestCase {
    
    func testMakeUsers() {
        let responseResult1 = APIResponseResult(
            gender: "Test Gender 1",
            name: nil,
            location: nil,
            email: "Test Email 1",
            login: nil,
            dob: nil,
            registered: nil,
            phone: nil,
            cell: nil,
            id: nil,
            picture: nil,
            nat: nil
        )
        
        let responseResult2 = APIResponseResult(
            gender: "Test Gender 2",
            name: nil,
            location: nil,
            email: "Test Email 2",
            login: nil,
            dob: nil,
            registered: nil,
            phone: "Test Phone 2",
            cell: nil,
            id: nil,
            picture: nil,
            nat: nil
        )
        
        let users = UserFactory.makeUsers(from: [responseResult1, responseResult2])
        
        XCTAssertEqual(2, users.count)
        
        XCTAssertEqual("Test Gender 1", users[0].gender)
        XCTAssertEqual("Test Email 1", users[0].email)
        XCTAssertNil(users[0].phone)
        
        XCTAssertEqual("Test Gender 2", users[1].gender)
        XCTAssertEqual("Test Email 2", users[1].email)
        XCTAssertEqual("Test Phone 2", users[1].phone)
    }

    func testMakeUser() {
        let responseResult = APIResponseResult(
            gender: "Test Gender",
            name: nil,
            location: nil,
            email: "Test Email",
            login: nil,
            dob: nil,
            registered: nil,
            phone: nil,
            cell: nil,
            id: nil,
            picture: nil,
            nat: nil
        )
        
        let user = UserFactory.makeUser(from: responseResult)
        
        XCTAssertEqual("Test Gender", user.gender)
        XCTAssertEqual("Test Email", user.email)
    }
    
}
