import UIKit

class CarDetailsViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    
    var viewModel: CarDetailsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadViewModel()
    }
    
    private func loadViewModel() {
        guard isViewLoaded, let viewModel = viewModel else { return }
        
        title = viewModel.controllerTitle
        
        viewModel.car?.valueChanged = { [weak self] _ in
            self?.nameLabel.text = viewModel.name
            self?.modelLabel.text = viewModel.model
            self?.brandLabel.text = viewModel.brand
            self?.brandLabel.text = viewModel.year
        }
    }
}
