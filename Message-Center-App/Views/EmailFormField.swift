//
//  FormField.swift
//  Message-Center-App
//
//  Created by Katelyn Biniak on 5/15/23.
//

import Foundation
import UIKit

@IBDesignable class EmailFormField: UIView {
    
    @IBOutlet weak var formTextField: UITextField!
    @IBOutlet weak var bottomBorderView: UIView!
    @IBOutlet weak var errorLabel: UILabel!

    fileprivate var validateRegex: NSPredicate = NSPredicate(format: "SELF MATCHES %@", Constants.emailRegex)
    fileprivate var contentView: UIView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadXib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadXib()
    }
    
    fileprivate func loadXib() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "EmailFormField", bundle: bundle)
        
        guard let contentView = nib.instantiate(withOwner: self).first as? UIView else { return }
        contentView.frame = self.bounds
        self.addSubview(contentView)
        
        self.formTextField.autocorrectionType = .no
        self.formTextField.keyboardType = .emailAddress
        self.formTextField.delegate = self
    }
    
    override func resignFirstResponder() -> Bool {
        formTextField.resignFirstResponder()
        return super.resignFirstResponder()
    }
}

// MARK: Public Functions
extension EmailFormField {
    
    public func shouldHideErrorLabel(_ isHidingError:Bool = true) {
        errorLabel.isHidden = isHidingError
    }
    
    public func validateText(_ text:String) -> Bool {
        let valid = validateRegex.evaluate(with: text)
        self.shouldHideErrorLabel(valid)
        return valid
    }
}

// MARK: UITextFieldDelegate Methods
extension EmailFormField: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        self.shouldHideErrorLabel()
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        guard let text = textField.text else { return true }
        let valid = validateText(text)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "EnableSearchButton"),
                                        object: nil,
                                        userInfo: [ "isValid": valid ]
        )
        return true
    }
}
