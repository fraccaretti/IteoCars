import UIKit

class CarsListTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var errorMessageLabel: UILabel!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var refreshButton: UIButton!
    
    var router: CarsListRouting?
    var viewModel: CarsListTableViewModel?
    
    private let reusableCellIdentifier: String = "CarsListTableViewCell"
    let addNewCarSegueIdentifier: String = "carsListToAddNewSegue"
    let carDetailsSegueIdentifier: String = "carsListToCarDetailsSegue"

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        router?.attach(self)
        
        loadViewModel()
    }
    
    @IBAction func onAddNewButtonTapped(_ sender: UIButton) {
        router?.routeToAddNewCar()
    }
    
    @IBAction func onRefreshButtonTapped(_ sender: UIButton) {
        hideErrorMessageLabel()
        viewModel?.refreshButtonTapped()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == carDetailsSegueIdentifier {
            router?.passCarToCarDetails(viewModel!.selectedCar!, withSegue: segue)
            viewModel?.selectedCar = nil
        }
    }
    
    private func loadViewModel() {
        guard isViewLoaded, let viewModel = viewModel else { return }
        
        title = viewModel.controllerTitle
        
        viewModel.isLoading.valueChanged = { [weak self] isLoading in
            if isLoading {
                self?.showLoadingIndicator()
            } else {
                self?.hideLoadingIndicator()
            }
        }
        
        viewModel.errorMessage.valueChanged = { [weak self] errorMessage in
            if let errorMessage = errorMessage {
                self?.showErrorMessageLabel(withMessage: errorMessage)
            } else {
                self?.hideErrorMessageLabel()
            }
        }
        
        viewModel.cellViewModels.valueChanged = { [weak self] _ in
            self?.tableView.reloadData()
        }
    }
    
    private func showErrorMessageLabel(withMessage message: String) {
        tableView.isHidden = true
        refreshButton.isHidden = false
        errorMessageLabel.text = "Cannot load cars list \n" + message
        errorMessageLabel.isHidden = false
    }
    
    private func hideErrorMessageLabel() {
        tableView.isHidden = false
        refreshButton.isHidden = true
        errorMessageLabel.text?.removeAll()
        errorMessageLabel.isHidden = true
    }
    
    private func showLoadingIndicator() {
        tableView.isHidden = true
        loadingIndicator.startAnimating()
        loadingIndicator.isHidden = false
    }
    
    private func hideLoadingIndicator() {
        tableView.isHidden = false
        loadingIndicator.stopAnimating()
        loadingIndicator.isHidden = true
    }
}

extension CarsListTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.selectedCar = viewModel?.cellViewModels.value[indexPath.row].car
        router?.routeToCarDetails()
    }
}

extension CarsListTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfCells ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reusableCellIdentifier, for: indexPath)
        if let cell = cell as? CarsListTableViewCell,
            let cellViewModel = viewModel?.cellViewModels.value[indexPath.row] {
            cell.setup(with: cellViewModel)
        }
        return cell
    }
}
