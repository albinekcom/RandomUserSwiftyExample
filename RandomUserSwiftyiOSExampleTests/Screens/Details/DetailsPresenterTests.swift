@testable import RandomUserSwiftyiOSExample
import XCTest

final class DetailsPresenterTests: XCTestCase {
    
    func testDetailsViewModels() {
        let presenter = DetailsPresenter()
        
        presenter.user = User(
            firstName: "Test First Name",
            lastName: "Test Last Name",
            gender: "Test Gender",
            email: "Test Email",
            phone: "Test Phone",
            cell: "Test Cell",
            isFavorite: false
        )
        
        let detailsViewModels = presenter.detailsViewModels
        
        XCTAssertEqual(6, detailsViewModels.count)
        
        XCTAssertEqual("First Name", detailsViewModels[0].textLabelText)
        XCTAssertEqual("Test First Name", detailsViewModels[0].detailsLabelText)
        
        XCTAssertEqual("Last Name", detailsViewModels[1].textLabelText)
        XCTAssertEqual("Test Last Name", detailsViewModels[1].detailsLabelText)
        
        XCTAssertEqual("Gender", detailsViewModels[2].textLabelText)
        XCTAssertEqual("Test Gender", detailsViewModels[2].detailsLabelText)
        
        XCTAssertEqual("Email", detailsViewModels[3].textLabelText)
        XCTAssertEqual("Test Email", detailsViewModels[3].detailsLabelText)
        
        XCTAssertEqual("Phone", detailsViewModels[4].textLabelText)
        XCTAssertEqual("Test Phone", detailsViewModels[4].detailsLabelText)
        
        XCTAssertEqual("Cell", detailsViewModels[5].textLabelText)
        XCTAssertEqual("Test Cell", detailsViewModels[5].detailsLabelText)
    }

}
