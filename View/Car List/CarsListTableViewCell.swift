import UIKit

class CarsListTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    
    func setup(with viewModel: CarsListCellViewModel) {
        self.nameLabel.text = viewModel.name
        self.modelLabel.text = viewModel.model
    }
}
