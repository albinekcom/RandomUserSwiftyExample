import Foundation

final class DetailsPresenter {
    
    var user: User?
    
    var detailsViewModels: [DetailsViewModel] {
        let firstNameDetailsViewModel = DetailsViewModel(textLabelText: "First Name", detailsLabelText: user?.firstName)
        let lastNameDetailsViewModel = DetailsViewModel(textLabelText: "Last Name", detailsLabelText: user?.lastName)
        let genderNameDetailsViewModel = DetailsViewModel(textLabelText: "Gender", detailsLabelText: user?.gender)
        let emailNameDetailsViewModel = DetailsViewModel(textLabelText: "Email", detailsLabelText: user?.email)
        let phoneNameDetailsViewModel = DetailsViewModel(textLabelText: "Phone", detailsLabelText: user?.phone)
        let cellNameDetailsViewModel = DetailsViewModel(textLabelText: "Cell", detailsLabelText: user?.cell)
        
        return [
            firstNameDetailsViewModel,
            lastNameDetailsViewModel,
            genderNameDetailsViewModel,
            emailNameDetailsViewModel,
            phoneNameDetailsViewModel,
            cellNameDetailsViewModel
        ]
    }
}
