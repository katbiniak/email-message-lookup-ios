//
//  LookupViewController.swift
//  Message Center App
//
//  Created by Katelyn Biniak on 5/11/23.
//

import UIKit
import Foundation

class LookupViewController: UIViewController {
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var searchButton: SearchButton!
    @IBOutlet weak var emailFormField: EmailFormField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup Tap gesture to resign first responder when keyboard is showing and user taps outside
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
        
        // Add notification observer to enable the search cta
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(enableSearchButton),
                                               name: NSNotification.Name(rawValue: "EnableSearchButton"),
                                               object: nil
        )
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.layoutIfNeeded()
    }
    
    // MARK: Observer Methods
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func enableSearchButton(_ notification: NSNotification) {
        if let isValid = notification.userInfo?["isValid"] as? Bool,
           isValid {
            searchButton.enabledState()
        } else {
            searchButton.disabledState()
        }
    }
}

// MARK: IBActions
extension LookupViewController {
    
    @IBAction func SearchButtonSelected(_ sender: SearchButton) {
        sender.isLoading = true
        getMessagesByEmail()
    }

}

//MARK: Public Functions
extension LookupViewController {

    public func getMessagesByEmail() {
        guard let email = emailFormField.formTextField.text else {
            return
        }
        
        MessageService.getAllMessages(for: email, completion: { (success, messages, errorMessage) in
            DispatchQueue.main.async {
                if success,
                let messages = messages {
                    self.navigateToResultsTableView(messages)
                    self.searchButton.isLoading = false
                    self.searchButton.enabledState()
                } else {
                    self.displayAlertMessage(errorMessage ?? "Unknown Error")
                    self.searchButton.isLoading = false
                }
            }
        })
    }
    
    public func displayAlertMessage(_ errorMessage: String) {
        let alertMessage = UIAlertController(title: "An Error Has Occured", message: errorMessage, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            self.searchButton.enabledState()
         })
        alertMessage.addAction(ok)

        self.present(alertMessage, animated: true)
    }
    
    public func navigateToResultsTableView(_ messages: [Message]) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let resultsTableViewController = storyBoard.instantiateViewController(withIdentifier: "ResultsTableViewController") as! ResultsTableViewController
        resultsTableViewController.messages = messages
        self.navigationController?.pushViewController(resultsTableViewController, animated: true)
    }
}

