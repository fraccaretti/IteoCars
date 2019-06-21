import UIKit

class CarAddingFormViewController: UIViewController {
    private let inputFormHeightConstant: CGFloat = 80
    
    @IBOutlet weak var nameInputTextField: UITextField!
    @IBOutlet weak var modelInputTextField: UITextField!
    @IBOutlet weak var brandInputTextField: UITextField!
    @IBOutlet weak var yearInputTextField: UITextField!
    @IBOutlet weak var nameInputFormViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var modelInputFormViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var brandInputFormViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var yearInputFormViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var errorMessageLabel: UILabel!
    
    var viewModel: CarAddingFormViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameInputTextField.delegate = self
        modelInputTextField.delegate = self
        brandInputTextField.delegate = self
        yearInputTextField.delegate = self
        
        loadViewModel()
    }
    
    @IBAction func onAddToListButtonTapped(_ sender: UIButton) {
        guard var viewModel = viewModel else { return }
        
        viewModel.name = nameInputTextField.text ?? ""
        viewModel.model = modelInputTextField.text ?? ""
        viewModel.brand = brandInputTextField.text ?? ""
        viewModel.year = yearInputTextField.text ?? ""
        
        if viewModel.isValid {
            errorMessageLabel.text = ""
            viewModel.addNewButtonTapped()
        } else {
            errorMessageLabel.text = ""
            for brokenRule in viewModel.brokenRules {
                errorMessageLabel.text?.append(brokenRule.message + "\n")
            }
        }
    }
    
    
    private func loadViewModel() {
        guard isViewLoaded, let viewModel = viewModel else { return }
        
        title = viewModel.controllerTitle
    }
    
    private func focusOnInputFormView(withTag tag: Int) {
        var inputFormViewsHeightConstraints = [nameInputFormViewHeightConstraint, modelInputFormViewHeightConstraint, brandInputFormViewHeightConstraint, yearInputFormViewHeightConstraint]
        inputFormViewsHeightConstraints.remove(at: tag - 1)
        for heightConstraint in inputFormViewsHeightConstraints {
            UIView.animate(withDuration: 1.5) {
                heightConstraint?.constant = 0
            }
        }
    }
    
    private func expandAllFormViews() {
        UIView.animate(withDuration: 1.5) { [weak self] in
            self?.nameInputFormViewHeightConstraint.constant = self?.inputFormHeightConstant ?? 80
            self?.modelInputFormViewHeightConstraint.constant = self?.inputFormHeightConstant ?? 80
            self?.brandInputFormViewHeightConstraint.constant = self?.inputFormHeightConstant ?? 80
            self?.yearInputFormViewHeightConstraint.constant = self?.inputFormHeightConstant ?? 80
        }
    }
    
    private func clearTextFields() {
        nameInputTextField.text = ""
        modelInputTextField.text = ""
        brandInputTextField.text = ""
        yearInputTextField.text = ""
    }
}

extension CarAddingFormViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        focusOnInputFormView(withTag: textField.tag)
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        expandAllFormViews()
        return false
    }
}
