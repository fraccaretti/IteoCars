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
    
    var viewModel: CarAddingFormViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onAddToListButtonTapped(_ sender: UIButton) {
        
    }
    
    private func focusOnInputFormView(withTag tag: Int) {
        var inputFormViewsHeightConstraints = [nameInputFormViewHeightConstraint, modelInputFormViewHeightConstraint, brandInputFormViewHeightConstraint, yearInputFormViewHeightConstraint]
        inputFormViewsHeightConstraints.remove(at: tag - 1)
        for heightConstraint in inputFormViewsHeightConstraints {
            heightConstraint?.constant = 0
        }
    }
    
    private func expandAllFormViews() {
        nameInputFormViewHeightConstraint.constant = inputFormHeightConstant
        modelInputFormViewHeightConstraint.constant = inputFormHeightConstant
        brandInputFormViewHeightConstraint.constant = inputFormHeightConstant
        yearInputFormViewHeightConstraint.constant = inputFormHeightConstant
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
    
    override func resignFirstResponder() -> Bool {
        expandAllFormViews()
        return true
    }
}
